public class SalesforceOAuth {
    public static String getAccessToken(String clientId, String clientSecret, String username, String password) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Set the endpoint URL
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token?grant_type=password');
        request.setMethod('POST');
        
        // Prepare the body with required parameters
        String body = 'grant_type=password' +
                      '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8') +
                      '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8') +
                      '&username=' + EncodingUtil.urlEncode(username, 'UTF-8') +
                      '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');
        
        request.setBody(body);
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        // Send the request and get the response
        HttpResponse response = http.send(request);
        
        System.debug('Status Code ::' + response.getStatusCode());
        // Check if the response is successful
        if (response.getStatusCode() == 200) {
            // Parse the JSON response to extract the access token
            Map<String, Object> jsonResponse = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            return (String) jsonResponse.get('access_token');
        } else {
            // Handle error response
            System.debug('Error: ' + response.getStatus() + ' - ' + response.getBody());
            return null;
        }
    }
    
    
    // Method to call the OAuth token endpoint and retrieve the access token
    @future(callout=true)
    public static void getOAuthAccessToken_async() {
        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set the body parameters (grant_type, client_id, client_secret, username, and password)
         	String clientId = '3MVG9pRzvMkjMb6k1lXIQwWk85kTvC8264l_Vw71XRNLt2B7dPB24PXqjyk_.0oS2EcmB4V9YDS3WsZtAK_kI';  // Replace with your Salesforce connected app's client ID
            String clientSecret = '6265CE49B068FFDCC147CA3900A0B5CB27D0950F60E4515ABA5F0F4751FDBFCC';  // Replace with your Salesforce connected app's client secret
            String username = 'rpvm.channel@curious-moose-bp08q6.com';  // Replace with the Salesforce username
            String password = 'Winter@2024Lp8gAZlptHUnO9pi1gjhdqUP';  // Replace with the Salesforce password and security token

            String body = 'grant_type=password'
                + '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8')
                + '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8')
                + '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
                + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');

            req.setBody(body);

            // Make the HTTP callout
            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                String accessToken = (String) resultMap.get('access_token');
                System.debug('Access Token: ' + accessToken);
            } else {
                System.debug('Error: ' + res.getBody());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
    }
    
    public static String getOAuthAccessToken() {
        String accessToken = '';
        try {
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/x-www-form-urlencoded');

             // Add the body parameters (grant_type, client_id, client_secret, username, and password)
            String clientId = '3MVG9pRzvMkjMb6k1lXIQwWk85kTvC8264l_Vw71XRNLt2B7dPB24PXqjyk_.0oS2EcmB4V9YDS3WsZtAK_kI';  // Replace with your Salesforce connected app's client ID
            String clientSecret = '6265CE49B068FFDCC147CA3900A0B5CB27D0950F60E4515ABA5F0F4751FDBFCC';  // Replace with your Salesforce connected app's client secret
            String username = 'rpvm.channel@curious-moose-bp08q6.com';  // Replace with the Salesforce username
            String password = 'Winter@2024Lp8gAZlptHUnO9pi1gjhdqUP';  // Replace with the Salesforce password and security token

            String body = 'grant_type=password'
                + '&client_id=' + EncodingUtil.urlEncode(clientId, 'UTF-8')
                + '&client_secret=' + EncodingUtil.urlEncode(clientSecret, 'UTF-8')
                + '&username=' + EncodingUtil.urlEncode(username, 'UTF-8')
                + '&password=' + EncodingUtil.urlEncode(password, 'UTF-8');

            req.setBody(body);

            // Make the HTTP callout
            Http http = new Http();
            HttpResponse res = http.send(req);

            if (res.getStatusCode() == 200) {
                // Parse the response
                System.debug('response body::' + res.getBody());
                
                Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                accessToken = (String) resultMap.get('access_token');
                System.debug('Access Token: ' + accessToken);
            } else {
                System.debug('Error: ' + res.getBody());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }

        return accessToken;
    }
    
    
    public static Integer getAccountCountFromWebService() {
        Integer accountCount = 0; // Variable to store the result

        try {
            
            String szaccessToken = getOAuthAccessToken();
            // Create a new HTTP request
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://curious-moose-bp08q6-dev-ed.trailblaze.my.salesforce.com/services/apexrest/AccountCount');
            req.setMethod('GET');
            req.setHeader('Authorization', 'Bearer ' + szaccessToken); // Use the session ID for authorization
            req.setHeader('Content-Type', 'application/json'); // Set the content type

            // Create an HTTP object to execute the request
            Http http = new Http();
            HttpResponse res = http.send(req);

            // Check the status code
            if (res.getStatusCode() == 200) {
                // Parse the response if successful
                accountCount = Integer.valueOf(res.getBody());
                System.debug('Total Account Count from Web Service: ' + accountCount);
            } else {
                System.debug('Failed to get account count. Status: ' + res.getStatusCode() + ' Response: ' + res.getBody());
            }

        } catch (Exception e) {
            // Handle any errors
            System.debug('Exception: ' + e.getMessage());
        }

        return accountCount;
    }
    
}