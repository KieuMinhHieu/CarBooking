/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.service;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import com.stress.dto.User;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Huy
 */
public class PayPalService {
    
    private static String CLIENT_ID = "AQBB6ylukBPaV0koVm2BrYx8MADG-msoOEVCpzMGizRj8g8BJ9hVcaYkLRIOTGeQ9z3D4smmPQxhzcrN";
    private static String CLIENT_SECRET = "EGUnZ4y9ifj7l9f7eypOidfhhdKMRcic63dr258BbJlCvCCHmRONmBsNQfKqZpj-yvWrb70a6Ij177ia";  
    private static String MODE = "sandbox";
    
    public String authorizePayment(String total, User user, HttpServletRequest request) throws PayPalRESTException {       
 
        Payer payer = getPayerInformation(user);
        RedirectUrls redirectUrls = getRedirectURLs(request);
        List<Transaction> listTransaction = getTransactionInformation(total);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation(User user) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(user.getUsername()).setEmail(user.getEmail());

        payer.setPayerInfo(payerInfo);

        return payer;
    }
     
    private RedirectUrls getRedirectURLs(HttpServletRequest request) {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(getBaseURL(request)+"/PayPalResponse");
        redirectUrls.setReturnUrl(getBaseURL(request)+"/PayPalResponse");
        return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(String total) {
        Details detail = new Details();
        detail.setShipping("0");
        detail.setSubtotal(total);
        detail.setTax("0");
        
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(total);
        amount.setDetails(detail);
        
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Recharge by paypal");
        
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        
        Item item = new Item();
        item.setCurrency("USD");
        item.setName("Recharge by paypal");
        item.setPrice(total);
        item.setTax("0");
        item.setQuantity("1");
        item.setPrice(total);
        
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        
        List<Transaction> listTransaction = new ArrayList<>();    
        listTransaction.add(transaction);
        return listTransaction;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }      

        return approvalLink;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId, String payerId)
        throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
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
