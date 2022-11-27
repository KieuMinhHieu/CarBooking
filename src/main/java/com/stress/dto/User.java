
package com.stress.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    public static final int INACTIVE = 0;
    public static final int ACTIVE_NORMAL = 1;
    public static final int ACTIVE_GOOGLE = 2;
    
    private String userID;
    private String username;
    private String password;
    private String email;
    private Date dob;
    private String address;
    private String phoneNumber;
    private boolean sex;
    private Role role;
    private String AccountBalance;
    private int status;
    
   
}
