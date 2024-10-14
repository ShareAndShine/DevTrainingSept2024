public with sharing class HotelReviewController {
    
    public static void validateHotelReview(List<Hotel_Review__c> hotelReviewList){
        for(Hotel_Review__c hotelReview : hotelReviewList){
            if(hotelReview.Account__c != null){
                // stop user from deleteing a record ... throw an error message
                // Use Salesforce default method named addErrror()
                
                hotelReview.addError('Cannot delete this review as it is associated with an hotel account.');
            }
        }
    }

    //create a method that takes list of new records being inserted into Hotel review custom object.
    // This code will be called from Hotel review Trigger. Code should check if customer rating is empty or not. 
    //IF empty set default value to 5 and then update the record
    public static void UpdateDefaultCustomerRating(List<Hotel_Review__c> newReviews){
        //Set default Rating 5 for new records
        for(Hotel_Review__c hr : newReviews){
            if(hr.Customer_Rating__c == null){
                hr.Customer_Rating__c = 3;
            }
        }

    }
}