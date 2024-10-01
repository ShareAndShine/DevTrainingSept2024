public class HotelHelper {

    // variables
    String hotelName;
    String hotelBillingCountry;
    String hotelCategory;
    String hotelLocationCity;
    
    // methods
    public void ShowHotelDetails()
    {
        // write logic
        
        System.debug('Hotel Name: ' + this.hotelName);
        System.debug('Billing Country: ' + this.hotelBillingCountry);
        System.debug('Location City: ' + this.hotelLocationCity);
        System.debug('Hotel Category: ' + this.hotelCategory);
  
    }

    public void SaveHotelInfo()
    {
        // write logic
    }

    public void getTotalReviewsByHotelId()
    {
        // write logic
    }

    public void learnListCollection()
    {
        List<String> lstHotelNames = new List<String>();
        lstHotelNames.add('SeaSide Resort');
        lstHotelNames.add('Tulip Resort');
        System.debug('Value of lstHotelNames is ' + lstHotelNames);

        // APEX + SOQL
        List<Account> lstHotelAccounts = new List<Account>();
        lstHotelAccounts = [SELECT Id, Name, Hotel_Latitude__c,  Hotel_Longitude__c FROM Account WHERE  Is_Partner_Hotel__c = true];
        System.debug('Value of lstHotelAccounts is ' + lstHotelAccounts);
    }

    public static void addIntegerList() {
        List<Integer> intList = new List<Integer>();
        
        Integer sum = 0;
        for (Integer num : intList) {
            sum += num;
        }
        System.debug('Sum of the integers in the list is: ' + sum);
    }

    public void getHotelReviewsStats(String AccountID)
    {
        // write logic to get hotel reviews stats
        
    }


}