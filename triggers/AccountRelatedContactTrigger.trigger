trigger AccountRelatedContactTrigger on Account (after update) {
    if(Trigger.isAfter|| Trigger.isUpdate){
        AccountRelatedContactUpdateHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
}