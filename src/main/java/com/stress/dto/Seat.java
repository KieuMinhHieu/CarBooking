
package com.stress.dto;

import javax.xml.bind.annotation.XmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement(name = "seat")
public class Seat {
    public static final int UNAVAILABLE = 0;
    public static final int AVAILABLE = 1;
    
    private String seatID; 
    private int	price;
    private int status;
    private Trip trip;
}
