@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
	
    @HttpGet 
    global static Account getAccount(){
        
     RestRequest request = RestContext.request;

       String AccountId = request.requestURI;
       List<String> listUri = AccountId.split('/');
       AccountId = listUri[listUri.size()-2];

     Account result =  [SELECT id, Name, (Select id, LastName from contacts)
                        FROM Account WHERE Id = :AccountId];
        return result;
        
    }    
   
}