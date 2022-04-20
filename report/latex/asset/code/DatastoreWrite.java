package ch.hesso.mse.cloud;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;

@SuppressWarnings("serial")
public class DatastoreWrite extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		// http://mse-cloud.appspot.com/datastorewrite?_kind=book&_key=837094&author=John%20Steinbeck&title=The%20Grapes%20of%20Wrath
		
		// Write the servlet answer
		resp.setContentType("text/plain");
		PrintWriter pw = resp.getWriter();
		pw.println("Writing entity to datastore.");
		
		//URL getter
		StringBuffer requestURL = req.getRequestURL();
		if (req.getQueryString() != null) {
		    requestURL.append("?").append(req.getQueryString());
		}
		
		String completeURL = requestURL.toString();
		pw.println(completeURL);
		
		//URL Handler
		Map<String, String> params = getQueryParams(completeURL);
		pw.println(params);
		
		
		// Datastore handler
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		
		if(params.containsKey("_kind")){
			// Creating entity object
			Entity entity = null;
			for (Map.Entry<String, String> entry : params.entrySet())
			{
				String key = entry.getKey();
				String value = entry.getValue();
				if(key.equals("_kind")){
					entity = new Entity(value);
				}
			}
			
			// Iteration over url keys
			for (Map.Entry<String, String> entry : params.entrySet())
			{	
				String key = entry.getKey();
				String value = entry.getValue();

				if(key.equals("_key")){
					entity.setProperty("_key", entry.getValue());
				}
				
				if(!key.equals("_kind")){
					entity.setProperty(key, value);
				}
			}
			
			Key key = datastore.put(entity);
			
			// If no _key param, set _key to gae key
			if(!params.containsKey("_key")){
				entity.setProperty("_key", key.getId());
				datastore.put(entity);
			}
			
		}else{
			pw.println("URL has no entity type declared with the key parameter = \"_kind\", please add it.");
		}
	}
	
	/**
	 * Method to get all the arguments of a url in a Map
	 * @param url String with the complete URL
	 * @return Map<String, String>
	 */
	public static Map<String, String> getQueryParams(String url) {
	    try {
	        Map<String, String> params = new HashMap<String, String>();
	        String[] urlParts = url.split("\\?");
	        if (urlParts.length > 1) {
	            String query = urlParts[1];
	            for (String param : query.split("&")) {
	                String[] pair = param.split("=");
	                String key = URLDecoder.decode(pair[0], "UTF-8");
	                String value = "";
	                if (pair.length > 1) {
	                    value = URLDecoder.decode(pair[1], "UTF-8");
	                }
	                params.put(key, value);
	            }
	        }
	        return params;
	    } catch (UnsupportedEncodingException ex) {
	        throw new AssertionError(ex);
	    }
	}
	
}


