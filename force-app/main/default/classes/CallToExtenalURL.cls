public with sharing class CallToExtenalURL {
    public CallToExtenalURL() {

    }

    public static void makeCallout() {
        
        HttpRequest request = new HttpRequest();
        // Set the endpoint using endpoint URL.
        String endpointURL = 'https://www.google.com';
        request.setEndpoint(endpointURL);
        
        // Set the request method.
        request.setMethod('GET');
        
        // Send the request, and return a response.
        HttpResponse response = new Http().send(request);
       
        // Process the response if necessary
        if (response.getStatusCode() == 200) { // 200 is the HTTP status code for 'OK'
            // Successful callout
            System.debug('Callout Successful, Response: ' + response.getBody());
        } else {
            // Failed callout
            System.debug('Callout Failed, Status Code: ' + response.getStatusCode());
        }
    }
}