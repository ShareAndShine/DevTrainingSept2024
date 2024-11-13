@isTest
private class CampaignMemberCounterTest {


@isTest
    static void testCountMembers() {
        // Create test data: Campaign
        Campaign campaign = new Campaign(Name = 'Test Campaign');
        insert campaign;

        // Create test data: Campaign Members
        List<CampaignMember> members = new List<CampaignMember>();
        for (Integer i = 0; i < 3; i++) {
            members.add(new CampaignMember(CampaignId = campaign.Id, LeadId = [SELECT Id FROM Lead LIMIT 1].Id));
        }
        insert members;

        // Call the countMembers method
        Test.startTest();
        CampaignMemberCounter counter = new CampaignMemberCounter();
        counter.countMembers(new List<Campaign>{ campaign });
        Test.stopTest();

        // Verify the results
        Campaign updatedCampaign = [SELECT Total_Lead_Members__c FROM Campaign WHERE Id = :campaign.Id];
        System.assertEquals(3, updatedCampaign.Total_Lead_Members__c, 'Total Lead Members should be 3');
    }
}