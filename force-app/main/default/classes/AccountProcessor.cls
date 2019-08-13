public class AccountProcessor {
    
    @future
    public static void countContacts(List<String> AccountId) {
       
        map<String, Account> lMapCtt = new map<String, Account>();
        for (Contact iCtt: [select Id, AccountId from Contact where AccountId = :AccountId])
        {
            Account lAcc = lMapCtt.get(iCtt.AccountId);
            if (lAcc == null)
            { 
                lAcc = new Account(Id = iCtt.AccountId, Number_of_Contacts__c = 0);
                lMapCtt.put(iCtt.AccountId, lAcc);
            }
            lAcc.Number_of_Contacts__c++;
        }       	
       Update lMapCtt.values();
    }
}