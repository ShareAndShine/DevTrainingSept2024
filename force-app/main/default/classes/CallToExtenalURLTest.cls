@isTest
private class CallToExtenalURLTest {

    
@isTest
    static void testGetMethodSuccess() {
        // Create a mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('Test_Resource'); // Assuming you have a static resource called 'Test_Resource' with the response body
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        
        // Set the mock callout mode
        Test.setMock(HttpCalloutMock.class, mock);
        
        // Call the method being tested
        Test.startTest();
        CallToExtenalURL.makeCallout();
        Test.stopTest();
        
        // Add assertions to verify the expected behavior of the method
        System.assertEquals(1, [SELECT COUNT() FROM HttpResponse WHERE StatusCode = 200], 'Expected one successful callout');
    }
}