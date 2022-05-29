global class EmailBatchClass implements Database.Batchable<sObject>{
    Map<Id, Contact> contactMap = new Map<Id, Contact>();
    public EmailBatchClass(Map<Id, Contact> conMap) {
        contactMap = conMap;
    }

    global Database.QueryLocator start(Database.BatchableContext dbc){
        return Database.getQueryLocator([SELECT id, firstname, email from Contact where Id in :contactMap.keySet()]);
    }

    global void execute(Database.BatchableContext bc, List<Contact> conL){
        for(Contact con: conL){
            Messaging.SingleEmailMessage singleMail = new Messaging.SingleEmailMessage();
            singleMail.setBccAddresses(new string[] {con.Email});
            singleMail.setSubject('Welcome Mail ContactMailSend1Trigger');
            singleMail.setPlainTextBody('test Body of ContactMailSend1Trigger, \n Welcome to SF');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{singleMail});
        }
    }

    global void finish(Database.BatchableContext dbc){

    }


}
