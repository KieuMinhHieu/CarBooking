
package com.stress.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Route {
    public static final boolean INACTIVE = false;
    public static final boolean ACTIVE = true;
    
    private int routeID;
    private String routeName;
    private Location startLocation;
    private Location endLocation;
    private String description;
    private boolean status;
}
