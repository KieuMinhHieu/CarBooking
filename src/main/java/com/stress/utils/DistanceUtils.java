
package com.stress.utils;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import com.stress.dto.Coordinates;
import com.stress.dto.DistanceAndTime;
import java.io.IOException;
import org.json.JSONArray;
import org.json.JSONObject;
/**
 *
 * @author Huy
 */
public class DistanceUtils {
    public static final String API_KEY = "xRKmWEDO-Klnp-dO7uJSfPp6UvyntWZleIa9mNEWE1w";
    
    public static final OkHttpClient client = new OkHttpClient();
    
    public Coordinates getCoordinate(String location) 
            throws IOException, InterruptedException{
        Coordinates co = new Coordinates();
        
        String url = "https://geocode.search.hereapi.com/v1/geocode?q="+location+"&apiKey="+API_KEY;
        Request request = new Request.Builder()
                .url(url)
                .build();

        try  {
            Response response = client.newCall(request).execute();
            String res = response.body().string();
            JSONObject jsonItem = new JSONObject(res);
        
            JSONArray jsonArray = jsonItem.getJSONArray("items");

            JSONObject json = jsonArray.getJSONObject(0);
            JSONObject position = (JSONObject) json.get("position");

            String lng = position.get("lng").toString();
            String lat = position.get("lat").toString();
            co.setLatitude(Double.parseDouble(lat));
            co.setLongitude(Double.parseDouble(lng));

            return co;
        }catch(Exception e){
            
        }
        return null;
    }
    
    public DistanceAndTime getDistanceAndTime(String originLoc, String destinationLoc) 
            throws IOException, InterruptedException{
        DistanceAndTime dat = new DistanceAndTime();
        Coordinates origin = getCoordinate(originLoc);
        Coordinates destination = getCoordinate(destinationLoc);
        
        String url = "https://router.hereapi.com/v8/routes?origin="
                +origin.getLatitude()+","+origin.getLongitude()+
                "&destination="+destination.getLatitude()+","+destination.getLongitude()+"&return=summary&transportMode=car&apikey="+API_KEY;
        
        Request request = new Request.Builder()
                .url(url)
                .build();

        try{
            Response response = client.newCall(request).execute();
            String res = response.body().string();
            
            JSONObject jsonItem = new JSONObject(res);
            JSONArray jsonArray = jsonItem.getJSONArray("routes");
            JSONObject json = jsonArray.getJSONObject(0);
            JSONArray jsonArray2 = json.getJSONArray("sections");
            JSONObject json2 = jsonArray2.getJSONObject(0);
            JSONObject summary = (JSONObject) json2.get("summary");
            
            double distance = Double.parseDouble(summary.get("length").toString())/1000;
            double time = Double.parseDouble(summary.get("duration").toString())/3600;
            
            dat.setDistance(distance);
            dat.setTime(time);
            
        }catch(Exception e){
            
        }
        return dat;
    }

}
