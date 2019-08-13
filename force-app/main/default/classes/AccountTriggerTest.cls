@isTest
private class AccountTriggerTest {
    @isTest static void TestCreateAccounts() {
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i);
            acct.BillingState = 'CA';
            accts.add(acct);
        }              
        // Perform Test
        Test.startTest();
        insert accts;                               
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> verifyAccts = [SELECT Id, BillingState, ShippingState FROM Account];
        System.assertEquals(200, verifyAccts.size());    
        
        for(Account a : verifyAccts ){
        System.assertEquals(a.BillingState, a.ShippingState); 
        }                            
    }
}