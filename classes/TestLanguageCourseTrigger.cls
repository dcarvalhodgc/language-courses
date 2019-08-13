@isTest
public  class TestLanguageCourseTrigger {
    
    @isTest static void TestLanguageCourseTrigger() {
        Language_Course_Designer__c CursoDesigner = new Language_Course_Designer__c();
        CursoDesigner.Name = 'teste';
        insert CursoDesigner;
        
        system.debug('CursoDesigner: '+ CursoDesigner);
        Language_Course_Designer__c queryCursoDesigner = [SELECT Id FROM Language_Course_Designer__c limit 1];
        system.debug('verifyAccts: '+ queryCursoDesigner);
        
        Test.startTest();
        
        Language_Course__c result = new Language_Course__c();
        result.Name = 'teste1';
        result.Language_Course_Designer__c = queryCursoDesigner.id;
        insert result;
        
        Test.stopTest();        
        
        system.debug('result: '+ result);
        
    }
}