// Its not a normal class so treat it in a different way
// use @isTest annotation to tell SF treat this class as a test class
@istest
private class HotelReviewTriggerTest {
    
    // write a test method to test UpdateDefaultCustomerRating method from HotelReviewController
    @istest
    private static void UpdateDefaultCustomerRatingTest()
    {

        // Step 1: Setup the test data for both postive (without rating ) and negative (with rating) scenario
        
        // Positive Scenario: Create a Hotel Review record with empty customer rating
        Hotel_Review__c objHotelReviewPositive = new Hotel_Review__c();
        objHotelReviewPositive.Customer_Review__c = 'Test Hotel Review - Without Rating' ;
        objHotelReviewPositive.Customer_Rating__c = null;

        // Negative Scenario: Create a Hotel Review record with customer rating
        Hotel_Review__c objHotelReviewNegative = new Hotel_Review__c();
        objHotelReviewNegative.Customer_Review__c = 'Test Hotel Review - With Rating ';
        objHotelReviewNegative.Customer_Rating__c = 3;

        // Step 2: Start the test
        Test.startTest();
            insert objHotelReviewPositive; // it will create the record virtually and not in the org DB
            insert objHotelReviewNegative;
        Test.stopTest();
        
        // Step 3: Assert the results
        // Use System.Assert to check if expected result and actual result matches


        Hotel_Review__c  ExpectedObjHotelReviewPositive = 
        [SELECT Id, Customer_Rating__c FROM Hotel_Review__c WHERE Id =:  objHotelReviewPositive.Id];

        // assert that actual rating is equal to expected rating        
        System.assertEquals(3, ExpectedObjHotelReviewPositive.Customer_Rating__c, 'Mismatch in default review rating when rating is not given by the customer');
        
        // negative test case - if expected rating is not equal to actual rating then test case fails
        Hotel_Review__c  ExpectedObjHotelReviewNegative = 
        [SELECT Id, Customer_Rating__c FROM Hotel_Review__c WHERE Id =:  objHotelReviewNegative.Id];

        //System.Assert
        System.assertEquals(3, objHotelReviewNegative.Customer_Rating__c, 'Mismatch in review rating when rating is  given by the customer');
        
    }

    // Apex  method to validateHotelReview from HotelReviewController
    @istest
    private static void validateHotelReviewTest()
    {
       
        /*
        // Postive Scenario
        // Step 1: Create a test hotel and hotel review record
        // Create Hotel Account
        Account objHotel = new Account();
        objHotel.Name = 'Test Hotel Account';
        objHotel.Industry = 'Hotels';
        

        // create hotel review record and associate with the hotel created above
        Hotel_Review__c objHotelReviewPositive = new Hotel_Review__c();
        objHotelReviewPositive.Customer_Review__c = 'Test Hotel Review - Without Rating' ;
        objHotelReviewPositive.Customer_Rating__c = null;
        System.debug('Value of objHotel.Id::' + objHotel.Id);
        objHotelReviewPositive.Account__c = objHotel.Id; // map review to the hotel
        

        // Step 2: Start the test by initiating delete operation
        Test.startTest();
            insert objHotel;
            insert objHotelReviewPositive;

            // initate delete operation and preserve the response (success/failure)
            Database.DeleteResult resultresultWithHotelAssociation =  Database.delete(objHotelReviewPositive, false);

        Test.stopTest();

        // Step 3: Assert the results
        // Use System.Assert to check if expected result and actual result matches
        System.assertEquals(false, resultresultWithHotelAssociation.isSuccess(), 'Delete should not be successful as review is associated with a hotel');
*/
        
        // Negative Scenario:
        // step 1: Setup test data 
        Hotel_Review__c objHotelReviewNegative = new Hotel_Review__c();
         objHotelReviewNegative.Customer_Review__c = 'Test Hotel Review - With Rating ';
         objHotelReviewNegative.Customer_Rating__c = 3;
         insert objHotelReviewNegative;

         // Step 2: start the test
         Test.startTest();
             // initate delete operation and preserve the response (success/failure)
             Database.DeleteResult resultWithNoHotelAssociation =  Database.delete(objHotelReviewNegative, false);
         Test.stopTest();

         // Step 3: Assert the results
         System.AssertEquals(true, resultWithNoHotelAssociation.isSuccess(), 'Delete should be successful as review is not associated with a hotel');

    }


}