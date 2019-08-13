public with sharing class AccountTriggerHandler {
    public static void CreateAccounts (List<Account> acct) {
        
        for (Account a : acct) {
            a.ShippingState = a.BillingState;

        }
        
        
    }
}