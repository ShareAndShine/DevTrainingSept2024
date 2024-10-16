public with sharing class HotelReviewNotifier {
    public HotelReviewNotifier() {

    }
    @future
    public static void notifyRelationshipOfficer(Hotel_Review__c review){
        if(review != null){
            if(review.Account__c != null){
                Account account = [SELECT Id, Relationship_Officer__c FROM Account WHERE Id =: review.Account__c];
                if(account != null){
                    if(account.Relationship_Officer__c != null){
                        Task relationshipTask = new Task();
                        relationshipTask.Subject = 'Follow up on Hotel Review';
                        relationshipTask.WhatId = review.Id;
                        relationshipTask.WhoId = account.Relationship_Officer__c;
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