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
    System.debug('Value of Trigger.new::' + Trigger.new); // collection 
    System.debug('Value of Trigger.oldMap::' + Trigger.oldMap); // collection 
    System.debug('Value of Trigger.newMap::' + Trigger.newMap);     // collection 
    
    
    // Stop hotel review record from getting deleted
    if(Trigger.isDelete && Trigger.isBefore)
    {
        // APEX Code
        System.debug('Inside before delete block & check on the hotel review record and hotel associaation');
        
        // Use Trigger.old check the data that user is attempting to delete
        for(Hotel_Review__c recHotelReview : Trigger.old)
        {
            System.debug('Record attempted to delete is ' + recHotelReview);
            if(recHotelReview.Account__c != null)
            {
                // stop user from deleteing a record ... throw an error message
                // Use Salesforce default method named addErrror()
                recHotelReview.addError('Cannot delete this review as it is associated with an hotel account');
            }
        }
        
    }
    
    if(Trigger.isDelete && Trigger.isAfter)
    {
        // APEX Code
        System.debug('I m inside after delete  block');
    }
    
    if(Trigger.isInsert)
    {
        // APEX Code
        System.debug('I m inside insert block');
    }
    
    
    if(Trigger.isUpdate)
    {
        // APEX Code
        System.debug('I m inside update block');
    }
    
    
}