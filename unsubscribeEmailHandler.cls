Global class unsubscribeEmailHandler implements Messaging.InboundEmailHandler{
    
    Global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env ) {
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        List<Contact> conlist = new List <contact>();
        List<Lead> leadlist = new List <lead>();
        String mySubject = email.subject.toLowerCase();
        String str = 'unsubscribe';
        Boolean isUnsubscribe;
        isUnsubscribe = mySubject.contains(str);
        
        if (isUnsubscribe == true) {
            try {
                for (Contact c : [SELECT Id, Name, Email, HasOptedOutOfEmail FROM Contact WHERE Email = :env.fromAddress AND hasOptedOutOfEmail = false LIMIT 100]) {
                    c.hasOptedOutOfEmail = true;
                    conlist.add(c);
                }
                update conlist;
            }
            catch (Exception e) {
                System.debug('Exception: ' + e.getMessage()+e.getLineNumber());
            }   
            
            try {
                for (Lead l : [SELECT Id, Name, Email, HasOptedOutOfEmail FROM Lead WHERE Email = :env.fromAddress AND isConverted = false AND hasOptedOutOfEmail = false LIMIT 100]) {
                    l.hasOptedOutOfEmail = true;
                    leadlist.add(l);
                } 
                update leadlist;
            }
            catch (Exception e) {
                System.debug('Exception: ' + e.getMessage() + e.getLineNumber());
            }   
        } 
        else {
            System.debug('No Unsuscribe' );
        }
        result.success = true;
        return result;
    }   
}