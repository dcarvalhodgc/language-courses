trigger LanguageCourseTrigger on Language_Course__c (before insert, before update, after insert, after update, after delete) {
    // <write your own notification code>
    
    
    LanguageCourseHandler handler = new LanguageCourseHandler();
    
    handler.newRecordList = trigger.new;
    handler.oldRecordList = trigger.old;
    handler.newRecordMap = trigger.newMap;
    handler.oldRecordMap = trigger.oldMap;
    
    if(trigger.isBefore)
    {
        if(trigger.isUpdate){ handler.onBeforeUpdate(); }
        if(trigger.isInsert){ handler.onBeforeInsert(); }
    }
    
}