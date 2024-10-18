public with sharing class HotelReviewNotifier {
    public HotelReviewNotifier() {

    }
    // works for single hotel Account ID
    public static void notifyRelationshipOfficer(ID hotelAccountId){
            if(hotelAccountId != null){
                Account account = [SELECT Id, Relationship_Officer__c FROM Account WHERE Id =: hotelAccountId];
                if(account != null){
                    if(account.Relationship_Officer__c != null){
                        Task relationshipTask = new Task();
                        relationshipTask.Subject = 'Follow up on Hotel Review';
                        relationshipTask.WhatId = hotelAccountId;
                        relationshipTask.Status = 'Not Started';
                        relationshipTask.Priority = 'Normal';
                        relationshipTask.ActivityDate = System.today() + 10;
                        relationshipTask.OwnerId = account.Relationship_Officer__c;
                        insert relationshipTask;
                    }
                }
            
        }
    }

    @future 
    public static void notifyRelationshipOfficer(List<ID> lsthotelAccountId){
        if(lsthotelAccountId != null){
            List<Account> lstaccount = [SELECT Id, Relationship_Officer__c FROM Account WHERE Id IN : lsthotelAccountId];
            if(lstaccount != null)
            {                
                for(Account account: lstaccount)
                {
                    if(account.Relationship_Officer__c != null){
                        Task relationshipTask = new Task();
                        relationshipTask.Subject = 'Follow up on Hotel Review';
                        relationshipTask.WhatId = account.Id;
                        relationshipTask.Status = 'Not Started';
                        relationshipTask.Priority = 'Normal';
                        relationshipTask.ActivityDate = System.today() + 10;
                        relationshipTask.OwnerId = account.Relationship_Officer__c;
                        insert relationshipTask;
                    }
                }
                
            }        
    }
}
}