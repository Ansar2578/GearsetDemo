trigger AccountRelatedContactInsertTrigger on Account (after insert) {
    If(Trigger.isAfter || Trigger.isInsert){
        AccountRelatedContactInsertHandler.afterInsert(Trigger.new);
    }
}