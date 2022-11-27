
package com.stress.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Location {
    public static final boolean UNAVAILABLE = false;
    public static final boolean AVAILABLE = true;
    private int locationID;
    private String locationName;
    private String Address;
    private City city;
    private boolean status;
}
