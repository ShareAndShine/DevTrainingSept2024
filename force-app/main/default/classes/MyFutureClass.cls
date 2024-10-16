public with sharing class MyFutureClass {
    public MyFutureClass() {

    }

    @future
    public static void SomeLongRunningCode()
    {
        // long running code
        // e.g 1: making a call to weather API
        // e.g 2: making a call to order processing system and sending newly created order
        // e.g 3: making a call to contracting  system and send newly created contract from salesforce  


    }
}