public class UpdateOpportunityLossReason {

    public static void updateClosedOpportunities() {
        List<Opportunity> oppList = [
            SELECT Id, Key_Deal_Competitor__c, StageName 
            FROM Opportunity 
            WHERE IsClosed = true AND Key_Deal_Competitor__c != null
        ];

        List<Opportunity> oppToUpdate = new List<Opportunity>();

        for (Opportunity opp : oppList) {
            String reason = generateLossReason();
            opp.Reason_for_Loss__c = reason;
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

    private static String generateLossReason() {
        List<String> reasons = new List<String>{
            'Pricing was significantly higher than competitors',
            'Product features did not meet customer\'s specific requirements',
            'Customer service issues led to loss of trust during the sales process',
            'Market presence was overshadowed by established competitors',
            'Lack of customization options compared to competitors',
            'Insufficient integration capabilities with other systems',
            'Poor user interface design made our solution less appealing',
            'Inadequate scalability options for growing businesses',
            'Longer implementation timeline compared to alternatives',
            'Limited mobile accessibility features',
            'Inflexible contract terms deterred potential customers',
            'Insufficient training and support resources offered',
            'Negative reviews and ratings influenced purchasing decision',
            'Lack of industry-specific solutions tailored to customer needs',
            'Inadequate reporting and analytics tools',
            'Security concerns raised during due diligence process',
            'Compliance issues with regulatory requirements',
            'Unfavorable comparison in independent product reviews',
            'Lengthy sales cycle compared to faster-moving competitors',
            'Inability to address unique business challenges faced by the customer',
            'Perceived lack of innovation compared to cutting-edge competitors',
            'Uncompetitive maintenance and support costs'
        };

        Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), reasons.size());
   		return reasons[randomIndex];
    }
}
