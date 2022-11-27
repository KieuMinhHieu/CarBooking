
package com.stress.dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    public static final int PENDING  = 0;
    public static final int COMPLETE  = 1;
    public static final int FAILED = 2;
    public static final int RETURN_REQUEST = 3;
    public static final int RETURN = 4;
    
    private String orderID;
    private Date createDate;
    private String paymentMode;
    private User user;
    private float totalPrice;
    private int status;
    
    public String getStringStatus() {
        String sStatus = "";
        if(this.status == 0) sStatus = "Pending";
        else if(this.status == COMPLETE) sStatus = "Complete";
        else if(this.status == FAILED) sStatus = "Failed";
        else if(this.status == RETURN_REQUEST) sStatus = "Return_Request";
        else if(this.status == RETURN) sStatus = "Returned";
        return sStatus;
    }
}
