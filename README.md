# ApexEmailService
#Salesforce
#Apex
#Email Service

Step 1: Create "Mailer"(Mailer__c) Object with one Long Text Area Field "Ext Id"(Ext_Id__c)
Step 2 : Create Apex Class with name mailInboundHandler
Step 3 : Setup -> Email Services -> New Email Service
         Enter Email Service Name
         Select Class
         Active = true -> Save
 Step 4 : Click on New Email Address
          Enter Email address
          Active = true -> Save
 Step 5 : copy generated email address and Send a mail !!
 
 
 
 
 Unsubscribe Email Service
 
Step 1 : Create Apex Class with name unsubscribeEmailHandler
Step 2 : Setup -> Email Services -> New Email Service
         Enter Email Service Name
         Select Class
         Active = true -> Save
 Step 3 : Click on New Email Address
          Enter Email address
          Active = true -> Save
 Step 4 : copy generated email address and Send a mail with subject line unsubscribe from a mail already present in contact or lead record!!
