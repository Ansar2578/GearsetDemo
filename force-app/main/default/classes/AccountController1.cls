public class AccountController1 {

    @AuraEnabled//Get Account Records
    public static List<Account> getAccountList(Integer pageSize, Integer pageNumber){
        Integer offset = (pageNumber - 1) * pageSize;
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, AccountNumber, Industry, Phone FROM Account LIMIT :pageSize OFFSET :offset];
        return accList;
    }
}