package com.stress.controllers;

import com.stress.dao.FeedbackDAO;
import com.stress.dao.OrderDAO;
import com.stress.dao.SeatDAO;
import com.stress.dao.TicketDAO;
import com.stress.dto.DistanceAndTime;
import com.stress.dto.Feedback;
import com.stress.dto.Order;
import com.stress.dto.Ticket;
import com.stress.dto.Trip;
import com.stress.dto.User;
import com.stress.service.FeedbackDAOImpl;
import com.stress.service.OrderDAOImpl;
import com.stress.service.SeatDAOImpl;
import com.stress.service.TicketDAOImpl;
import com.stress.service.TripDAOImpl;
import com.stress.service.UserDAOImpl;
import com.stress.utils.DistanceUtils;
import com.stress.utils.Email;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "showHistory":
                    showOrderView(request, response);
                    break;
                case "detail":
                    showDetailView(request, response);
                    break;
                case "Return":
                    showReturnTicket(request, response);
                    break;
                case "Feedback":
                    showFeedBack(request, response);
                    break;
                case "pendingOrder":
                    pendingOrder(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String action = request.getParameter("action");
            switch (action) {
                case "showHistory":
                    showOrderView(request, response);
                    break;
                case "detail":
                    showDetailView(request, response);
                    break;
                case "return":
                    returnTicket(request, response);
                    break;
                case "Return":
                    showReturnTicket(request, response);
                    break;
                case "Approve":
                    approveReturnTicket(request, response);
                    break;
                case "Reject":
                    break;
                case "sendFeedback":
                    sendFeedback(request, response);
                    break;

                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            System.out.println("Error at Post " + e.toString());
        }
    }

    private void sendFeedback(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "./client/404.jsp";
        try {
            String orderID = request.getParameter("orderID");
            String tripID = request.getParameter("tripID");
            String comment = request.getParameter("comment");

            Trip trip = new TripDAOImpl().getTripByID(tripID);
            Order order = new OrderDAOImpl().getOderByID(orderID);
            int rating = Integer.parseInt(request.getParameter("rating"));
            Feedback fb = new Feedback(0, rating, comment, order, trip);
            DistanceAndTime tripTime = new DistanceUtils().getDistanceAndTime(
                    trip.getRoute().getStartLocation().getCity().getCityName(),
                    trip.getRoute().getEndLocation().getCity().getCityName());

            long realTimeGoing = (long) tripTime.getTime();
            LocalTime StartTime = trip.getStartTime().toLocalTime();
            LocalDateTime finishTrip = trip.getStartDateTime().toLocalDate().atTime(StartTime).plusHours(realTimeGoing);


            //if (finishTrip.isAfter(LocalDateTime.now())) {
                //request.setAttribute("ERROR", "Trip Has not finished yet! You Cant Feedback");
            //} else {
                FeedbackDAO fbDAO = new FeedbackDAOImpl();
                if (fbDAO.sendFeedback(fb)) {
                    request.setAttribute("SUCCESS", "Thank you for your feedback!");
                } else {
                    request.setAttribute("ERROR", "Something Wrong! Please Try Again!");
                }
            //}
            showFeedBack(request, response);

        } catch (Exception e) {
            System.out.println("Error at Send Feedback " + e.toString());
        }

    }

    private void showFeedBack(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "./client/404.jsp";
        try {
            String orderID = request.getParameter("orderID");
            OrderDAO oDAO = new OrderDAOImpl();

            List<Ticket> tList = new TicketDAOImpl().getTicketByOrderID(orderID);
            Feedback fb = new FeedbackDAOImpl().getFeedbackByOrderID(orderID);
            if (tList.size() <= 0) {
                request.setAttribute("ERROR", "You are not booking any ticket in this order!");
                showOrderView(request, response);
            } else if (fb != null) {
                System.out.println(fb.getComment());
                Ticket t = tList.get(0);
                request.setAttribute("TICKET", t);
                request.setAttribute("FEEDBACK", fb);
                request.setAttribute("FB_ALREADY", "You have Feedback this Order Already!");
                url = "./client/comment-rating.jsp";
            } else {
                Ticket t = tList.get(0);
                request.setAttribute("TICKET", t);
                url = "./client/comment-rating.jsp";
            }

        } catch (Exception e) {
            System.out.println("Error at show Feed back " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void approveReturnTicket(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "./client/404.jsp";
        try {
            String orderID = request.getParameter("orderID");
            OrderDAO orderDAO = new OrderDAOImpl();
            // should set status for order to INT
            Order od = orderDAO.getOderByID(orderID);
            if (od != null) {
                od.setStatus(Order.RETURN);
                new OrderDAOImpl().updateOrder(od);
                SeatDAO sDAO = new SeatDAOImpl();
                TicketDAO tDAO = new TicketDAOImpl();
                List<Ticket> ticketList = tDAO.getTicketByOrderID(orderID);
                // Get Total Money to return for User
                double returnMoney = od.getTotalPrice();
                for (Ticket ticket : ticketList) {
                    sDAO.updateSeat(ticket.getTrip().getTripID(), ticket.getSeat().getSeatID());
                }

                double accountBalance = Double.parseDouble(od.getUser().getAccountBalance());
                accountBalance += returnMoney;

                new UserDAOImpl().updateUser(od.getUser().getUserID(), String.valueOf(accountBalance));

                Email.sendEmail(od.getUser().getEmail(), "", "The Return Ticket Request Has been Approved!\nPlease Check Again Information:\nOrder: "
                        + od.getOrderID() + "\n" + "Create Date: " + od.getCreateDate() + "\n\tWe have recover money into Your AccountBalance! For further information"
                        + ", Please Contact: 079_809_1101\n\t\t\tGROUP STRESS", "Return Ticket Successfully");
                request.setAttribute("ORDER", od);
                request.setAttribute("RETURN_SUCCESS", "Approve Return Success!");
                url = "./admin/orderTable.jsp";
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            System.out.println("Error at Approve Return Ticket Controller " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void showReturnTicket(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "./client/404.jsp";
        try {
            String orderID = request.getParameter("orderID");
            OrderDAO orderDAO = new OrderDAOImpl();
            Order od = orderDAO.getOderByID(orderID);
            if (od != null && od.getStatus() != Order.FAILED && od.getStatus() != Order.PENDING) {
                if (od.getStatus() == Order.RETURN) {
                    request.setAttribute("ERROR", "Return it Already!");
                }
                request.setAttribute("ORDER", od);
                HttpSession session = request.getSession();
                session.setAttribute("LOGIN_USER", new UserDAOImpl().getUserByEmail("carbookingstress@gmail.com"));
                url = "./admin/orderTable.jsp";
            } else {
                url = "./client/404.jsp";
                request.setAttribute("ERROR", "User havent pay for this Order! Can Return!");
            }
        } catch (Exception e) {
            System.out.println("Error at Return Ticket Controller " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void returnTicket(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "./client/404.jsp";
        try {

            String orderID = request.getParameter("orderID");
            OrderDAO oDAO = new OrderDAOImpl();
            Order od = oDAO.getOderByID(orderID);
            if (od.getStatus() == Order.FAILED && od.getStatus() == Order.PENDING) {
                request.setAttribute("ERROR", "Cant not Return this Order! You haven't payed yet");
                showDetailView(request, response);
            } else if (od.getStatus() == Order.RETURN) {
                request.setAttribute("ERROR", "Cant not Return this Order! You had returned it already!");
                showDetailView(request, response);
            } else {

                od.setStatus(Order.RETURN_REQUEST);
                new OrderDAOImpl().updateOrder(od);
                List<Ticket> ticketList = new TicketDAOImpl().getTicketByOrderID(orderID);
                Date goingDate = ticketList.get(0).getSeat().getTrip().getStartDateTime();
                if (Date.valueOf(LocalDate.now()).after(goingDate)) {
                    request.setAttribute("ERROR", "Cant not Return this Order! This Trip is already Going");
                    showDetailView(request, response);
                } else {
                    Email.sendEmail("carbookingstress@gmail.com", "", "A customer want to Return an Order\n" + "Please "
                            + "click at the link below\n"
                            + "http://localhost:8080/ETrans/order?action=Return&orderID=" + orderID, "Return Order Request");
                    request.setAttribute("RETURN_ORDER_SUCCESS", "An Email has send to Staff. You Request will be processed in a shortest Time");
                    showDetailView(request, response);
                }
            }
        } catch (Exception e) {
            System.out.println("Error at Return Ticket Controller " + e.toString());
        }

    }

    private void showOrderView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            OrderDAO orderDAO = new OrderDAOImpl();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("LOGIN_USER");
            if (user != null) {
                List<Order> list = orderDAO.getAllOrderByUserID(user.getUserID());
                if (list != null) {
                    request.setAttribute("ORDER_LIST", list);
                    request.getRequestDispatcher("./client/profile.jsp").forward(request, response);
                } else {
                    request.setAttribute("NO_INFORMATION", "NO INFORMATION");
                    request.getRequestDispatcher("./client/profile.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("NO_INFORMATION", "NO INFORMATION");
                request.getRequestDispatcher("./client/profile.jsp").forward(request, response);
            }
        } catch (Exception e) {
        }
    }

    private void showDetailView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orderID = request.getParameter("orderID");
            TicketDAO ticketDAO = new TicketDAOImpl();
            List<Ticket> ticket = ticketDAO.getTicketByOrderID(orderID);
            request.setAttribute("ORDER_ID", orderID);
            request.setAttribute("TICKET", ticket);
            request.getRequestDispatcher("/client/order-detail.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private void pendingOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/client/order.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

}
