<%@page import="com.stress.dto.Seat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    var checkout = $(".checkout-button-seat");
    console.log(checkout);
    var choice = drawMapSeat();
    
    console.log(choice);

    checkout.click(function () {
        console.log("click");
        url = window.location.href;
        position = url.search("ETrans") + 7;
        newurl = url.slice(0, position);
        window.location.replace(newurl + 'book?' + "tripID=" + "<%=request.getAttribute("tripID")%>" + "&" + "seatID=" + choice + "&action=createTrip");
    });

    function drawMapSeat() {
        var seatMap = generateSeatMap(<%=request.getAttribute("totalSeat")%>);
        var data = "<%=request.getAttribute("unavailabelSeat")%>";

        console.log(data);

        var seatAreChosen = data.split(",");
        seatAreChosen.pop();

//        seatAreChosen.push('A_1');
        var cart = $(".selected-seats"),
                counter = $(".counter-seat"),
                total = $(".total-seat"),
                choice = [],
                sc = $(".seat-map-seat").seatCharts({
            map: seatMap,
            seats: {
                e: {
                    price: 150000,
                    classes: "economy-class", //your custom CSS class
                    category: "Economy Class"
                }
            },

            naming: {
                top: false,
                rows: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M'],
                columns: ['1', '2', '3', '4', '5']
            },
            legend: {
                node: $("#legend"),
                items: [
                    ["e", "available", "Available Seat"],
                    ["f", "unavailable", "Unavailable Seat"]
                ]
            },
            click: function () {
                if (this.status() === "available") {
                    choice.push(this.settings.id);
                    console.log("inside chart: " + choice);
                    //console.log(sc.find('selected').seatIds)
                    //let's create a new <li> which we'll add to the cart items
                    //this.data().category +
                    $(
                            "<li>" +
                            this.settings.id +
                            ": <b>" +
                            this.data().price +
                            ' VND </b> <a class="cancel-cart-item"></a></li>'
                            )
                            .attr("id", "cart-item-" + this.settings.id)
                            .data("seatId", this.settings.id)
                            .appendTo(cart);
                    counter.text(sc.find("selected").length + 1);
                    total.text(recalculateTotal(sc) + this.data().price);
                    return "selected";
                } else if (this.status() === "selected") {
                    const index = choice.indexOf(this.settings.id);
                    if (index > -1) {
                        // only splice array when item is found
                        choice.splice(index, 1); // 2nd parameter means remove one item only
                    }
                    console.log(choice);
                    //update the counter
                    counter.text(sc.find("selected").length - 1);
                    //and total
                    total.text(recalculateTotal(sc) - this.data().price);
                    //remove the item from our cart
                    $("#cart-item-" + this.settings.id).remove();
                    //seat has been vacated
                    return "available";
                } else if (this.status() === "unavailable") {
                    //seat has been already booked
                    return "unavailable";
                } else {
                    return this.style();
                }
            }
        });
        //this will handle "[cancel]" link clicks
        $("#selected-seats").on("click", ".cancel-cart-item", function () {
            //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
            sc.get($(this).parents("li:first").data("seatId")).click();
        });
//        var seatAreChosen = ['A_1', 'B_1', 'C_4', 'D_5'];
        //let's pretend some seats have already been booked
        sc.get(seatAreChosen).status("unavailable");
        
        var seat = $(".seatCharts-row:eq(0) > div:nth-child(2)");
        seat.html("<img width='30' height='30' src='http://cdn.onlinewebfonts.com/svg/img_251807.png'>");
        
        var seatIcon = $(".seatCharts-legendList");
	seatIcon.append("<li class='seatCharts-legendItem'>\n\
                            <span style='margin-left: -78px;'>\n\
                                <img width='30' height='30' src='http://cdn.onlinewebfonts.com/svg/img_251807.png'>\n\
                            </span>\n\
                            <span style='margin-left:25px;'>Driver</span>\n\
                        </li>");		
        
        return choice;

    }

    function recalculateTotal(sc) {
        var total = 0;
        //basically find every selected seat and sum its price
        sc.find("selected").each(function () {
            total += this.data().price;
        });
        return total;
    }
    
    function generateSeatMap(totalSeat) {
        if (totalSeat === 16) {
            return [
                "____",
                "ee_e",
                "ee__",     
                "ee_e",
                "ee_e",
                "eeee"
            ];
        }
        if (totalSeat === 29) {
            return [
                "_____",
                "ee_ee",
                "ee_ee",
                "ee___",
                "ee_ee",
                "ee_ee",
                "ee___",
                "ee_ee",
                "eeeee"
            ];
        }
        if (totalSeat === 45) {
            return [
                "_____",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "ee_ee",
                "eeeee"
            ];
        }
    }

</script>