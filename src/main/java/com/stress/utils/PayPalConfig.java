/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.utils;

import com.paypal.base.exception.PayPalException;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Huy
 */
public class PayPalConfig {
    public Map paypalSdkConfig(){
        Map sdkConfig = new HashMap<>();
        sdkConfig.put("mode", "sandbox");
        return sdkConfig;
    }
    
    public OAuthTokenCredential authTokenCredential(){
        return new OAuthTokenCredential(Constants.PAYPAL_CLIENT_ID, Constants.PAYPAL_SECRET, paypalSdkConfig());
    }
    
    public APIContext apiContext() throws PayPalRESTException{
        APIContext apiContext = new APIContext(authTokenCredential().getAccessToken());
        apiContext.setConfigurationMap(paypalSdkConfig());
        return apiContext;
    }
    
    public static String getBaseURL(HttpServletRequest request){
        String scheme = request.getScheme();
        String serverName = request.getServerName();
        int serverPort = request.getServerPort();
        String contextPath = request.getContextPath();
        StringBuilder url = new StringBuilder();
        url.append(scheme).append("://").append(serverName);
        if((serverPort!=80) && (serverPort!=433)){
            url.append(":").append(serverPort);
        }
        url.append(contextPath);
        if(url.toString().endsWith("/")){
            url.append("/");
        }
        return url.toString();
    }
}
