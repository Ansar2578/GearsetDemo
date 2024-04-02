public class AccountRelatedContactUpdateHandler {
    public static void afterUpdate(List<Account> newAccounts, Map<Id,Account> oldAccounts){
        Set<Id> setOfIds = new Set<Id>();
        List<Contact> lstCotactUpdate = new List<Contact>();
        if(!newAccounts.isEmpty()){
            for(Account acc : newAccounts){
                if(acc.Phone != Null && acc.Phone != oldAccounts.get(acc.Id).Phone){
                    acc.isChecked__c = true;
                    setOfIds.add(acc.Id);
                }
            }   
            /*List<Account> lstOfAccounts = [SELECT Id,Name,isChecked__c From Account where id=: setOfIds];
            for(Account acc1 :lstOfAccounts ){
                acc1.isChecked__c = true;
            }*/
            List<Contact> lstContact = [SELECT Id, Name, Phone,AccountId, Account.Phone from Contact WHERE AccountId= :setOfIds ];
            for(Contact con : lstContact){
                if(con.Phone != con.Account.Phone){
                    con.Phone = con.Account.Phone;
                    lstCotactUpdate.add(con);
                }
            }
            /*if(!lstOfAccounts.isEmpty()){
                update lstOfAccounts;
            }*/
            if(!lstCotactUpdate.isEmpty()){
                update lstCotactUpdate;
            }
        }
    }
}