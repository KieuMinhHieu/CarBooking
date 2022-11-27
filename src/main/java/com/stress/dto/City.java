
package com.stress.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class City {
    private int cityID;
    private String cityName;
    
    @Override
    public String toString() {
        return  cityID + " - " + cityName;
    }
}
