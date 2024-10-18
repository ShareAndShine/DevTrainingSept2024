@isTest
private class HotelReviewNotifierTest {

@isTest
    static void testNotifyRelationshipOfficer() {
        Account testAccount = new Account(
            Name = 'Test Account',
            Relationship_Officer__c = UserInfo.getUserId() // Assuming current user is a user record
        );
        insert testAccount;
        
        Test.startTest();
        HotelReviewNotifier.notifyRelationshipOfficer(testAccount.Id);
        Test.stopTest();
        
        Task[] tasks = [SELECT Id FROM Task];
        System.assertEquals(1, tasks.size(), 'Expected one task to be created.');
    }
}