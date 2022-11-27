package com.stress.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import static com.stress.utils.Constants.ACCESS_KEY;
import static com.stress.utils.Constants.END_POINT;
import static com.stress.utils.Constants.EXTRA_DATA;
import static com.stress.utils.Constants.NOTIFY_URL;
import static com.stress.utils.Constants.ORDER_ID;
import static com.stress.utils.Constants.ORDER_INFOR;
import static com.stress.utils.Constants.PARTNER_CODE;
import static com.stress.utils.Constants.REQUEST_ID;
import static com.stress.utils.Constants.REQUEST_TYPE;
import static com.stress.utils.Constants.RETURN_URL;
import static com.stress.utils.Constants.SECRET_KEY;
import static com.stress.utils.DigitalSignature.signHmacSHA256;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

@WebServlet(name = "MoMoRequestController", urlPatterns = {"/MoMoRequest"})
public class MoMoRequestController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            switch(action){
                case "sendMoMo":
                    payMoMo(request,response);
                case "recharge":
                    showRechargePage(request,response);
                case "payMoMo":
                    payMoMoV2(request,response);
            }
        } catch (Exception e) {
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            switch(action){
                case "sendMoMo":
                    payMoMo(request,response);
                case "recharge":
                    showRechargePage(request,response);
                case "payMoMo":
                    payMoMoV2(request,response);
            }
        } catch (Exception e) {
        }
    }
    
    

    private void payMoMo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            // Get amount of booking car
            String amount = request.getParameter("amount");
            
            String requestRawData = new StringBuilder()
                .append("accessKey").append("=").append(ACCESS_KEY).append("&")
                .append("amount").append("=").append(amount).append("&")
                .append("extraData").append("=").append(EXTRA_DATA).append("&")
                .append("ipnUrl").append("=").append(NOTIFY_URL).append("&")
                .append("orderId").append("=").append(ORDER_ID).append("&")
                .append("orderInfo").append("=").append(ORDER_INFOR).append("&")
                .append("partnerCode").append("=").append(PARTNER_CODE).append("&")
                .append("redirectUrl").append("=").append(RETURN_URL).append("&")
                .append("requestId").append("=").append(REQUEST_ID).append("&")
                .append("requestType").append("=").append(REQUEST_TYPE)
                .toString();

            String signRequest = signHmacSHA256(requestRawData, SECRET_KEY);
            HttpResponse<String> res = sendPost(PARTNER_CODE, "Car Booking", "MoMoStore", REQUEST_ID, amount, ORDER_ID, 
                    ORDER_INFOR, RETURN_URL, NOTIFY_URL, EXTRA_DATA, REQUEST_TYPE, signRequest);
            
            JSONObject jj = new JSONObject(res.body());
            response.sendRedirect(jj.get("payUrl").toString());
        } catch (Exception e) {
        }
    }
    
    public HttpResponse<String> sendPost(final String partnerCode, final String partnerName, final String storeId,
            final String requestId, final String amount, final String orderId, final String orderInfo,
            final String redirectUrl, final String ipnUrl, final String extraData, final String requestType,
            final String signature) throws IOException, InterruptedException, URISyntaxException {

        HashMap<String, String> values = new HashMap<String, String>() {
            {
                put("partnerCode", partnerCode);
                put("partnerName", partnerName);
                put("storeId", storeId);
                put("requestId", requestId);
                put("amount", amount);
                put("orderId", orderId);
                put("orderInfo", orderInfo);
                put("redirectUrl", redirectUrl);
                put("ipnUrl", ipnUrl);
                put("lang", "en");
                put("extraData", extraData);
                put("requestType", requestType);
                put("signature", signature);
            }
        };
        ObjectMapper objectMapper = new ObjectMapper();
        
        String requestBody = objectMapper.writeValueAsString(values);
        
        HttpClient client = HttpClient.newHttpClient();
        
        HttpRequest request = HttpRequest.newBuilder()
                .setHeader("Content-Type", "application/json")
                .uri(new URI(END_POINT))
                .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                .build();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        return response;
    }

    private void showRechargePage(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        try {
            request.getRequestDispatcher("/client/recharge.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private void payMoMoV2(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            // Get amount of booking car
            String amount = request.getParameter("amount");
            
            String requestRawData = new StringBuilder()
                .append("accessKey").append("=").append(ACCESS_KEY).append("&")
                .append("amount").append("=").append(amount).append("&")
                .append("extraData").append("=").append(EXTRA_DATA).append("&")
                .append("ipnUrl").append("=").append(NOTIFY_URL).append("&")
                .append("orderId").append("=").append(ORDER_ID).append("&")
                .append("orderInfo").append("=").append(ORDER_INFOR).append("&")
                .append("partnerCode").append("=").append(PARTNER_CODE).append("&")
                .append("redirectUrl").append("=").append(RETURN_URL).append("&")
                .append("requestId").append("=").append(REQUEST_ID).append("&")
                .append("requestType").append("=").append(REQUEST_TYPE)
                .toString();

            String signRequest = signHmacSHA256(requestRawData, SECRET_KEY);
            HttpResponse<String> res = sendPost(PARTNER_CODE, "Car Booking", "MoMoStore", REQUEST_ID, amount, ORDER_ID, 
                    ORDER_INFOR, RETURN_URL, NOTIFY_URL, EXTRA_DATA, REQUEST_TYPE, signRequest);
            
            JSONObject jj = new JSONObject(res.body());
            response.sendRedirect(jj.get("payUrl").toString());
        } catch (Exception e) {
        }
    }
}

