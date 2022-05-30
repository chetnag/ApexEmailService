global class mailInboundHandler implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String text ='';
        text = email.plainTextBody;
        try{
            Mailer__c member = new Mailer__c(Ext_Id__c = text,Name = email.subject);
            INSERT member;
        }catch(Exception e){
            System.debug('Exception : '+e.getLineNumber() + e.getMessage());
        }
        result.success = true;
        return result;
    }

}