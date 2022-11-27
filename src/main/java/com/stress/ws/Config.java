/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.ws;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;

/**
 *
 * @author MinhQuang
 */

@ApplicationPath("/api")
public class Config extends ResourceConfig {
    public Config() {
        packages("com.stress.ws");
    }
}
