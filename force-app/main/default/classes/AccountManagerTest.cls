@isTest
public class AccountManagerTest {
    
    @testSetup 
    static void setup() {
        List<Contact> contacts = new List<Contact>();
        List<Account> accounts = new List<Account>();
          
        accounts.add(new Account(name='AccountTest1'));
        insert accounts;
        
      
        for (Account account : [select id from account]) {
            contacts.add(new Contact(firstname='first', 
                lastname='last', accountId=account.id));
        }
        insert contacts;
    }

   
   @isTest static void tesGetById(){
        
        Id recordId = [select id from account where Name = 'AccountTest1'].id;
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/Contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        test.startTest();
        Account thisAccount = AccountManager.getAccount();
        test.stopTest();
        System.assert(thisAccount != null);
        System.assert(thisAccount.Number_of_Contacts__c != null);       
       
    }
}