public class Hotel{

    //variables | Using which we can change or provide new values and create multiple replicas 

    // default scope of variables is private
     String hotelName;
     String hotelBillingCountry;
     String hotelCategory;
     String hotelLocationCity;
     String hotelWebsite;
     String hotelPhone;
     String hotelBillingStreet;
     
     private Integer hotelDiscount; 

    // constructor
     public Hotel() {

      
     }

     // constructor with hotelname and country as inputs
     public Hotel(String strHotelName, String strBillingCountry){
         this.hotelName = strHotelName;
         this.hotelBillingCountry = strBillingCountry;
     }

     // constructor with hotelname , billing city, billing street, billing country, website and phone number as inputs
     public Hotel(String strHotelName, String strBillingCity, String strBillingStreet, 
            String strBillingCountry, String strHotelWebsite, String strHotelPhone)
            {
         
               // assign inputs paramaters to class variable

               this.hotelName = strHotelName;
               this.hotelBillingCountry = strBillingCountry;
               this.hotelLocationCity = strBillingCity;
               this.hotelBillingStreet = strBillingStreet;
               this.hotelWebsite = strHotelWebsite;
               this.hotelPhone = strHotelPhone;

     }


     // Methods | Nothing but actions

     // method to create a new hotel record on account object. Can use class variables as input paramaters and insert a record into account object
     public Id createHotel(){
        
        // create new instance of account
        Account objAccount = new Account();

        // assign values to account
        objAccount.Name = this.hotelName;
        objAccount.BillingCountry = this.hotelBillingCountry;
        objAccount.BillingCity = this.hotelLocationCity;
        objAccount.BillingStreet = this.hotelBillingStreet;
        objAccount.Phone   = this.hotelPhone;
        objAccount.Website = this.hotelWebsite;

        // call the inbuilt method to insert a new record
        insert objAccount; // DML Statment

        return objAccount.Id; // Salesforce will hold id of the newly created record and return it to the parent method
     }

     // method to update account record website field with value from input paramter and account id
     
     public void updateWebsite(String strWebsite, string strhotelAccountId){
        
      // 1. fetch the record from the account table with a matching id to the accountId passed to the method
      // 2. update the new value in the field
      // 3. run an update statement
      
   
        // query account record by id and update website        
        Account recAcc = [SELECT Id, Name, Website FROM Account WHERE Id =: strhotelAccountId];
        recAcc.Website = strWebsite; 
        update recAcc; // DML Statement

      }

      // method to update Rating field on hotel review custom object . Input paramter should be hotel review id and rating
      public void updateHotelRating(Integer iRating, String strHotelReviewId)
      {
          // query custom object record by id and update rating
          Hotel_Review__c recHotel = [SELECT Id, Name, Customer_Rating__c FROM Hotel_Review__c WHERE Id =: strHotelReviewId];
          recHotel.Customer_Rating__c = iRating;
          update recHotel;
      }

      // method to create multiple hotel account records. Should take list of accounts as input parameter. 
      public void createMultipleHotelAccounts(List<Account> lstAccounts){
          insert lstAccounts; // simply pass on lst of objects to the insert command. APEX will know how to deal with the list object

          
      }


    // method to create multiple hotel account records. Should take list of accounts as input parameter. 
    public void createMultipleHotelAccounts_WithPartialInsertEnabled(List<Account> lstAccounts)
    {
    
        Database.SaveResult[]  results =  Database.insert(lstAccounts, false); // simply pass on lst of objects to the insert command. APEX will know how to deal with the list object
    
        // Read the response from Database.insert and then check if the record status is success or error. Accordingly handle error and success
        for(Database.SaveResult objAccResult : results)
        {
            if(objAccResult.isSuccess())
            {
                System.debug('Record created successfully. ID: ' + objAccResult.getId());
            }
            else
            {
                // failed records are stored in a collection internaly
                for(Database.Error objError : objAccResult.getErrors())
                {
                    System.debug('Error Message: ' + objError.getMessage());
                    System.debug('Error Status Code: ' + objError.getStatusCode());
                }
            }
       }
}
      
     
    /* public void createHotelRecord()
     {
        // write some logic to create a new account record with the values we have provided in the variables

        // this keyword is used to refer the variables mentioned in the class

        System.debug('Hotel Name: ' + this.hotelName); 
        System.debug('Billing Country: ' + this.hotelBillingCountry);
        System.debug('Location City: ' + this.hotelLocationCity);
        System.debug('Hotel Category: ' + this.hotelCategory);

        // call the method that calculates discount and assign that to hotel discount variable
        this.generateRandomDiscount();
        System.debug('Random Discount generated : ' + this.hotelDiscount);
        

        // Use APEX Inbuilt methods to create records in the org
        Account objAcc = new Account(); // blue print of the account object
        objAcc.Name = this.hotelName;
        objAcc.BillingCountry = this.hotelBillingCountry;
        objAcc.BillingCity = this.hotelLocationCity;


        // syntax: insert <object with values>
        //call the insert method and pass on account obj
        insert objAcc;


     }*/

     public void generateLoginPassword()
     {
        // TO be implemented
     }

     private void generateRandomDiscount()
     {
        // This is a private method
        // We can call this method only inside this class
        // We cannot access this method outside of this class

         this.hotelDiscount =  Integer.valueof((Math.random() * 10));
        
     }

    public Map<String, Decimal> getHotelStats()
    {
            // Create a map to hold avg. hotel rating and hotel reviews count
        Map<String, Decimal> objHotelStats = new Map<String, Decimal>();

        objHotelStats.put('AvgHotelRating', 4.2);
        objHotelStats.put('TotalHotelReviews', 10);

        System.debug('Hotel Stats ::' + objHotelStats);
        System.debug('Total Hotel Reviews ::' + objHotelStats.get('TotalHotelReviews'));

        return objHotelStats; // 2 data points
    }


    // Use auraenabled annotation to make this method accessible by a LWC compoent
    @AuraEnabled(cacheable=true)
    public static Map<String, Decimal> getHotelStatsByHotelId(String hotelAccountID)
    {

        // call soql query to get avg. hotel rating and hotel reviews count
       AggregateResult[] results =  [SELECT Account__r.ID, COUNT(Id) totalReviews, AVG(Customer_Rating__c) avgRating FROM Hotel_Review__c Where Account__r.Id =: hotelAccountID group by Account__r.Id];

       // Create a map to hold avg. hotel rating and hotel reviews count
       Map<String, Decimal> objHotelStats = new Map<String, Decimal>();

       // check if there is any record
       if(results.size() > 0)
       {
            System.debug('Total Hotel Reviews ::' + results[0].get('totalReviews'));
            System.debug('Avg Rating ::' + results[0].get('avgRating'));

            

            objHotelStats.put('AvgHotelRating', (Decimal)results[0].get('avgRating'));
            objHotelStats.put('TotalHotelReviews', (Decimal)results[0].get('totalReviews'));
            

       }

       return objHotelStats; // 2 data points
    }

}