@isTest
public class PlatformOrderEventTest {
    @isTest static void test1(){
        
        Order_Event__e newsOrderEvent = new Order_Event__e(
            //Location__c='Mountain City', 
            //Urgent__c=true, 
            //News_Content__c='Lake Road is closed due to mudslides.',
            Order_Number__c = 'test',
            Has_Shipped__c = true);
        test.startTest();
        Database.SaveResult sr = EventBus.publish(newsOrderEvent);
        test.stopTest();
        
        System.assert(sr.isSuccess());
        // Check that the case that the trigger created is present.
       	User myUser = [SELECT Id FROM User WHERE Name='Douglas Gonçalves Carvalho' LIMIT 1];
        List<task> tasks = [SELECT Id FROM task where OwnerId =: myUser.id];
        // Validate that this case was found.
        // There is only one test case in test context.
        System.assert(!tasks.iSEmpty());
        
    }
}