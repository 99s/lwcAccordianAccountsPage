public with sharing class AccordianAccountClass {
    
    @AuraEnabled(cacheable=true)
    public static Integer totalAccountCount() {  
        return [select count() from Account];
    }  




    @AuraEnabled(cacheable=true)
    public static List<Account> getContactsAndAccs(Integer blockSize, Integer index)
    {
    List<Account> accList = [
        select Id,Name,Rating,Phone,
        (select Id,Name,phone from contacts)
        FROM Account Order By name LIMIT :blockSize OFFSET :index ];
    return accList;
    }
}



    
