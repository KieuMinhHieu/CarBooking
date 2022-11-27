
package com.stress.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ticket {
    private int ticketID;
    private Seat seat;
    private Trip trip; 
    private Order order;
}
