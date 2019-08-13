/*
* Autor: Squad Canais Criticos - Deloitte
* Data: 24/07/2019
* Descrição: [CEC - Release 3] - [Time: SQUAD Canais Criticos - Sprint 10] 
* 
* Controle de Versão
* ---------------------------------------------------------------
* Data: 24/07/2019  
* Autor: Squad Canais Criticos
* Alterações: Utilização de TriggerHandler atualização do campo unidade de  negocio e produto do case
* ---------------------------------------------------------------
*/

public class LanguageCourseHandler {
	
    //## Atributes
    public 	Map<Id,Language_Course__c> 	newRecordMap;
    public 	Map<Id,Language_Course__c> 	oldRecordMap;
    public 	List<Language_Course__c> 	newRecordList;
    public 	List<Language_Course__c> 	oldRecordList;
    
    //## Constructor
    public LanguageCourseHandler()
    {
        this.newRecordMap 	= new Map<Id,Language_Course__c>();
        this.oldRecordMap 	= new Map<Id,Language_Course__c>();
        this.newRecordList 	= new List<Language_Course__c>();
        this.oldRecordList 	= new List<Language_Course__c>();
    }
    
    
    public void onBeforeInsert()
    {
        definirParametroAoInserir('Insert');
    }
    
    public void onBeforeUpdate()
    {
        definirParametroAoInserir('Update');
    } 
    
    private void definirParametroAoInserir(String parametro)
    {
        if(parametro == 'Insert'){
            system.debug('Insert');
        }else{
           system.debug('Update'); 
        }
        
    }
    
}