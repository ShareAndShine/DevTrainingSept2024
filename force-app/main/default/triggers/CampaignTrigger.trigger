trigger CampaignTrigger on Campaign (after insert, after update) {
    CampaignTriggerHandler handler = new CampaignTriggerHandler();
    handler.afterInsertOrUpdate();
}




