public class UpdateOpportunityCompetitors {

    // Custom picklist field API name for competitor
    public static final String COMPETITOR_FIELD_API_NAME = 'Key_Deal_Competitor__c';

    // Master list of competitors
    private static final List<String> COMPETITOR_LIST = new List<String>{
        'Amazon Web Services',
        'Microsoft Azure',
        'Google Cloud Platform',
        'IBM Cloud',
        'Oracle Cloud Infrastructure',
        'Salesforce',
        'Adobe Experience Cloud',
        'HubSpot',
        'Zoho CRM',
        'Freshworks',
        'Pipedrive',
        'Copper CRM',
        'Pardot',
        'Marketo',
        'Mailchimp',
        'Constant Contact',
        'SendGrid',
        'Twilio',
        'Nexmo',
        'MessageBird'
    };

    public static void updateClosedLostOpportunities() {
        List<Opportunity> oppList = [
            SELECT Id, StageName 
            FROM Opportunity 
            WHERE IsClosed = true AND StageName = 'Closed Lost'
        ];

        List<Opportunity> oppToUpdate = new List<Opportunity>();

        for (Opportunity opp : oppList) {
            String competitorName = getRandomCompetitorName();
            opp.put(COMPETITOR_FIELD_API_NAME, competitorName);
            oppToUpdate.add(opp);

            if (oppToUpdate.size() == 200 || oppList.isEmpty()) {
                try {
                    update oppToUpdate;
                    oppToUpdate.clear();
                } catch (DmlException e) {
                    System.debug(LoggingLevel.ERROR, 'Error updating opportunities: ' + e.getMessage());
                }
            }
        }

        if (!oppToUpdate.isEmpty()) {
            try {
                update oppToUpdate;
            } catch (DmlException e) {
                System.debug(LoggingLevel.ERROR, 'Error updating remaining opportunities: ' + e.getMessage());
            }
        }
    }

    private static String getRandomCompetitorName() {
        Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), COMPETITOR_LIST.size());
        return COMPETITOR_LIST[randomIndex];
    }

   

    public class CustomException extends Exception {}
}
