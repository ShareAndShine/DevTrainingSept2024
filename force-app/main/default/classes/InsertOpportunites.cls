public class InsertOpportunities {
    public static void insertFiftyOpportunities() {
        List<Opportunity> opps = new List<Opportunity>();
        
        String[] accountIds = new String[] {
            '0014y00003flznTAAQ',
            '0014y00003flznUAAQ',
            '0014y00003flznVAAQ',
            '0014y00003flznWAAQ',
            '0014y00003flznXAAQ',
            '0014y00003flznYAAQ'
        };
        
        for (Integer i = 0; i < 50; i++) {
            Opportunity opp = new Opportunity();
            
            // Set AccountId randomly
            opp.AccountId = accountIds[Integer.valueOf(Math.floor(Math.random() * 6))];
            
            // Set other fields
            opp.Name = 'Acme Deal ' + i.toString(); // Using a proper-sounding company name
            opp.StageName = 'Closed Lost';
            opp.CloseDate = Date.today().addDays(30); // Set close date 30 days from now
            opp.Amount = Math.round(Math.random() * 50000) + 1000; // Random amount between $1,000 and $51,000
            
            opps.add(opp);
        }
        
        try {
            insert opps;
            System.debug('Successfully inserted 50 opportunities.');
        } catch(DmlException e) {
            System.debug('Error inserting opportunities: ' + e.getMessage());
        }
    }
}
