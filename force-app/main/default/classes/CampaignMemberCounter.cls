public with sharing class CampaignMemberCounter {
    public void countMembers(List<Campaign> campaigns) {
        Map<Id, Integer> campaignMemberCountMap = new Map<Id, Integer>();
        for (CampaignMember member : [SELECT CampaignId FROM CampaignMember WHERE CampaignId IN :campaigns]) {
            if (!campaignMemberCountMap.containsKey(member.CampaignId)) {
                campaignMemberCountMap.put(member.CampaignId, 0);
            }
            campaignMemberCountMap.put(member.CampaignId, campaignMemberCountMap.get(member.CampaignId) + 1);
        }
        for (Campaign campaign : campaigns) {
            campaign.Total_Lead_Members__c = campaignMemberCountMap.get(campaign.Id);
        }
        update campaigns;
    }
}