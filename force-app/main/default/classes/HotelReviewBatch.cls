global with sharing class HotelReviewBatch implements Database.Batchable<sObject>{
    
    // start
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Query all Hotel_Review__c records with Customer_Rating__c < 2
        String query = 'SELECT Id, Account__c, Account__r.Relationship_Officer__c, Contact__c, Customer_Review_Sentiment__c, Customer_Review__c, Customer_Sentiment_Index__c, Customer_Rating__c FROM Hotel_Review__c WHERE Customer_Rating__c <= 2';
        return Database.getQueryLocator(query);
    }

    
    // execute -> Once code inside start function completes then it automatically transfers the control to excute function

    global void execute(Database.BatchableContext BC, List<Hotel_Review__c> scope) {

        // a list to hold list of task records  to get created  
        List<Task> tasksToCreate = new List<Task>();
        
        // use scope and loop thru each Htoel review record and start creating tasks

        for(Hotel_Review__c hR : scope){
            // create task and populate task fields with data
            if(hR.Account__r.Relationship_Officer__c != null)
            {
                Task hTask = new Task();

                hTask.Subject = 'Follow up on Hotel Review';
                hTask.WhatId = hR.Account__c;
                hTask.Status = 'Not Started';
                hTask.Priority = 'Normal';
                hTask.ActivityDate = System.today() + 10;
                hTask.OwnerId = hR.Account__r.Relationship_Officer__c;

                // add tasks to be create in a collection 
                tasksToCreate.add(hTask);

            }
        }

        // use DML to add collection of tasks
         try
         {
            insert tasksToCreate;
         }
          catch(Exception ex){
            System.debug('Exception ex: ' + ex);
         }
    }
    
    //finish -> Once all the records are processed then the final method to get called is finish
    global void finish(Database.BatchableContext BC) {
        // Finish logic here


        System.debug('Batch job finished !! All tasks have been created for low review ratings');
    }
    

}