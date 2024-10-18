// Design the trigger in such a way that it can run all times for all operations (insert, update, delete)
// Use Trigger.isInsert,Trigger.isUpdate, Trigger.isDelete and control the flow of your code 

trigger HotelReviewTrigger on Hotel_Review__c (before insert, before update, before delete, after insert, after update, after delete)
//trigger HotelReviewTrigger on Hotel_Review__c (before delete)
{
	//APEX Code
    System.debug('Value of Trigger.isInsert::' + Trigger.isInsert);
    System.debug('Value of Trigger.isUpdate::' + Trigger.isUpdate);
    System.debug('Value of Trigger.isDelete::' + Trigger.isDelete);
    
    System.debug('Value of Trigger.isafter::' + Trigger.isafter);
    System.debug('Value of Trigger.isbefore::' + Trigger.isbefore);

    
    System.debug('Value of Trigger.old::' + Trigger.old); // collection 
    System.debug('Value of Trigger.new::' + Trigger.new); // collection | will carry record(s) only during insert operation
    System.debug('Value of Trigger.oldMap::' + Trigger.oldMap); // collection 
    System.debug('Value of Trigger.newMap::' + Trigger.newMap);     // collection 
    
    
    // Stop hotel review record from getting deleted
    if(Trigger.isDelete && Trigger.isBefore)
    {
        // pass Trigger.old as an argument
        HotelReviewController.validateHotelReview(Trigger.old);         
        
    }
    
    if(Trigger.isDelete && Trigger.isAfter)
    {
        // APEX Code
        System.debug('I m inside after delete  block');
    }
    
    if(Trigger.isInsert && Trigger.isBefore)
    {
        
        // call UpdateDefaultCustomerRating() and send list of hotel review records being inserted as input arugument   
        HotelReviewController.UpdateDefaultCustomerRating(Trigger.new);

    }
    

    if(Trigger.isInsert && Trigger.isAfter)
    {
        // check if hotel review rating is < 2 then call notifyRelationshipOfficer
        
        // loop thru Trigger.New and check if rating is <2 . If yes, add account Id to a list
        List<Id> hotelAccountIds = new List<Id>();

        for(Hotel_Review__c reviewRecord : Trigger.new)
        {
            if(reviewRecord.Customer_Rating__c <2)
            {
                hotelAccountIds.add(reviewRecord.Account__c);
            }
        }


        HotelReviewNotifier.notifyRelationshipOfficer(hotelAccountIds);
    }

    if(Trigger.isUpdate)
    {
        // APEX Code
        System.debug('I m inside update block');
    }
    
    
}