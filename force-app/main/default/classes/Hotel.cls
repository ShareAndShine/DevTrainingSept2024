public class Hotel{

    //variables | Using which we can change or provide new values and create multiple replicas 

    // default scope of variables is private
     public String hotelName;
     public String hotelBillingCountry;
     public String hotelCategory;
     public String hotelLocationCity;
     
     private Integer hotelDiscount; 

     // Methods | Nothing but actions
     
     public void createHotelRecord()
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


     }

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

     

}