@IsTest
private class LeadProcessorTest {
	@testSetup
    static void setup() {
        List<lead> ListLead = new List<lead>();
        for(Integer i=0; i<10;i++) {
            ListLead.add(new Lead(LastName = 'Lead' + i, Company = 'Company' + i, MobilePhone = 'MobilePhone' + i));
        }
        insert ListLead;
    }
   
    @IsTest static  void test() {        
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from Lead where LeadSource  = 'Dreamforce']);
    }
}