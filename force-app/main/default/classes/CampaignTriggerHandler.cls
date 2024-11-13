public with sharing class CampaignTriggerHandler {
    public void afterInsertOrUpdate() {
        CampaignMemberCounter counter = new CampaignMemberCounter();
        counter.countMembers(Trigger.new);
    }
}