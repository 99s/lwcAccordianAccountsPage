public with sharing class BatchClassCall1 {
    public BatchClassCall1() {
        System.debug('------targetuser.Ctargetuser------');
DateTime now = System.now();
//System.debug(Limits.getDMLStatements());

try{
    //Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
               //email.setToAddresses(new string[] {'lastknight7331@gmail.com'});
               //email.setSubject('Welcome Mail');
               //email.setPlainTextBody('Welcome Your Contact Is Created ghg Successfully In Salesforce');
           //Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    
    Contact a = [SELECT Id, Name, Email FROM Contact WHERE Email = 'lastknight7331@gmail.com'];
    System.debug('e.getMessage()::::');
    System.debug(a.Email);
    Map<Id, Contact> AccountIdMaps = new Map<Id, Contact>();
    AccountIdMaps.put(a.Id, a);
    Database.executeBatch(new EmailBatchClass(AccountIdMaps), 200);
}
catch(Exception e){
    System.debug(e.getMessage());

} 



    }
}
