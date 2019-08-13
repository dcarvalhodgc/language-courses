trigger OrderEventTrigger on Order_Event__e (after insert) {
	
    List<Task> listTaks = new List<Task>();
    
    User myUser = [SELECT Id FROM User WHERE Name='Douglas Gonçalves Carvalho' LIMIT 1];
    
    for(Order_Event__e event : Trigger.new){
        if(event.Has_Shipped__c == true){
            listTaks.add(new Task(Status = 'Not Started', Subject ='Follow up on shipped order ' + event.Order_Number__c,
                                  Priority = 'Medium', OwnerId = myUser.Id));
        }         
    }
    insert listTaks;
}