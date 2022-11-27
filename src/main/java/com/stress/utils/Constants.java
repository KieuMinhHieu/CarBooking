/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.utils;

import java.util.UUID;

public class Constants {
    // Captcha
    public static String CAPTCHA_SITE_KEY = "6LcFThUiAAAAAEZk9isOhp_hFXnYQpQPjQtRdU17";
    public static String CAPTCHA_SECRET_KEY = "6LcFThUiAAAAAD4Mk080Gff2rY7Oob57GrgA8Ohv";
    // Google
    public static String GOOGLE_CLIENT_ID = "199152751272-83nokhduk5llpkp4vkt55hp9qmci27vc.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/ETrans/login";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    // MoMo
    public static String PARTNER_CODE = "MOMOI3J920220921";
    public static String ACCESS_KEY = "yzp3lsHbJJifAkNU";
    public static String SECRET_KEY = "CJLOBZMb1CpjqpDl9bhA9zqnCTv2ThSY";
    public static String END_POINT = "https://test-payment.momo.vn/v2/gateway/api/create";
    public static String RETURN_URL = "http://localhost:8080/ETrans/MoMoResponse"; // Gửi đến trang checkout thành công
    public static String NOTIFY_URL = "http://localhost:8080/ETrans/MoMoNotify";
    public static String ORDER_ID = UUID.randomUUID().toString();
//    public static String AMOUNT = "30000";
    public static String ORDER_INFOR = "PAY WITH MOMO";
    public static String REQUEST_ID = UUID.randomUUID().toString();
    public static String REQUEST_TYPE = "captureWallet";
    public static String EXTRA_DATA = "";
    
    //PayPal
    public static String PAYPAL_CLIENT_ID = "AQBB6ylukBPaV0koVm2BrYx8MADG-msoOEVCpzMGizRj8g8BJ9hVcaYkLRIOTGeQ9z3D4smmPQxhzcrN";
    public static String PAYPAL_SECRET = "EGjXQFG47g2ExiKpX-rRG0MspaMSNSF3o7qgLJVmBUBPyDFvr9NQ5EnMrga-o0Z7AFfAD0UiXf5uuPZN";  
    public static String PAYPAL_MODE = "sandbox";
}
