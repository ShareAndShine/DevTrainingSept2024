@isTest
private class HotelTest {

@isTest
    static void testGetHotelStatsByHotelId() {
        // Test data
        Account testHotel = new Account(Name = 'Test Hotel');
        insert testHotel;

        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = testHotel.Id);
        insert testContact;

        Hotel_Review__c testReview = new Hotel_Review__c(
            Account__c = testHotel.Id,
            Contact__c = testContact.Id,
            Customer_Rating__c = 4.5,
            Customer_Review_Sentiment__c = 'Positive'
        );
        insert testReview;


        Hotel_Review__c testReview2 = new Hotel_Review__c(
            Account__c = testHotel.Id,
            Contact__c = testContact.Id,
            Customer_Rating__c = 3.0,
            Customer_Review_Sentiment__c = 'Negative'
        );
        insert testReview2;

        // Call the method
        Map<String, Decimal> hotelStats = Hotel.getHotelStatsByHotelId(testHotel.ID);


        
        // Verify the results
        System.assertEquals(2, hotelStats.size());
        System.assertEquals(4.5, hotelStats.get('AvgHotelRating'));
        System.assertEquals(2, hotelStats.get('TotalHotelReviews'));
    }
}