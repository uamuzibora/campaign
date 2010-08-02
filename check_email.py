# from poplib import *
# import time
# from email.Parser import Parser
import poplib, email, string
import StringIO
from importDB import *
import db
import time
import smtplib
import config
from email.mime.text import MIMEText
# def getSubj(which):
# # return subject of message with id 'which'
#     msg = "\n".join(server.top(which, 1)[1])
#     p=Parser()
#     email = p.parsestr(msg)
#     #print email.keys()
#     #for part in email.walk():
#         #print part
#         #print part.get_payload()
#     #print email.is_multipart()
#     #print email.get_filename()
#     if email.is_multipart():

#         for p in emai
 #       l.ge    import email.utilst_payload():        
 #            print "Params",
#  p.get_params()
#             print p.get_filename()
#     return email.get("Subject")


db_imp=importDB()
db=db.db()
f=open(config.log_path+"log.txt","a")
# messagesInfo = server.list()


# numMsgs = server.stat()[0]
# print "Num msg by stat():", numMsgs
# print "Num msg by list():", len(server.list()[1])
# for i in range(numMsgs):
#     print "Number",i," ", getSubj(numMsgs-i)

def not_imported(mail, numb):
    ret=False
    if len(db.query("SELECT id FROM email where mail_number = "+str(numb)).getresult())==0:
        ret=True
    return ret

def sendMail(msg,subject,to):
    smtpserver = smtplib.SMTP("smtp.gmail.com",587)
    smtpserver.ehlo()
    smtpserver.starttls()
    smtpserver.ehlo
    smtpserver.login("uamuziboratest@gmail.com", "uamuzibora")
    mail=MIMEText(msg)
    mail['Subject']=subject
    mail['to']=to
    
    smtpserver.sendmail('uamuziboratest@gmail.com',[to],mail.as_string())
    smtpserver.quit
numMessages0=0
#sendMail("Hvordan gar det?","Morn","gunnarroe@gmail.com")
while True:
    
    mailserver = poplib.POP3_SSL("pop.gmail.com",995)
    mailserver.getwelcome()
    mailserver.user("uamuziboratest@gmail.com")
    mailserver.pass_("uamuzibora")
    if(len(mailserver.list()[1])>numMessages0):
        numMessages1=len(mailserver.list()[1])
    for i in reversed(range(numMessages1)[(numMessages1-(numMessages1-numMessages0)):]):

            msg = mailserver.retr(i+1)
            stri = string.join(msg[1], "\n")
            msg="""
This email was procceced by uamuzibora,
the results are as follows:
               """
            mail = email.message_from_string(stri)
            
            imported=False
            for part in mail.walk():
                if part.is_multipart():
                    continue
                dtypes = part.get_params(None, 'Content-Disposition')
                if not dtypes:
                    if part.get_content_type() == 'text/plain':
                        continue
                    ctypes = part.get_params()
                    if not ctypes:
                        continue
                    for key,val in ctypes:
                        if key.lower() == 'name':
                            break
                    else:
                        continue
                else:
                    attachment,filename = None,None
                    for key,val in dtypes:
                        key = key.lower()
                        if key == 'filename':
                            filename = val
                        if key == 'attachment':
                            attachment = 1
                    if attachment:
                        
                        if os.path.splitext(filename)[1]==".csv" and not_imported(mail,i+1):

                            file_data=part.get_payload(decode=True) 
                            s=StringIO.StringIO(file_data)

                            s.content_type = part.get_content_type()
                            try:
                                num,error=db_imp(s)
                            except:
                                msg="""
An unknown error happened,
Could you please forward this email to : gunnarroe@gmail.com,
Wait for further instruction before trying to submitt the csv sheets.
"""
                                msg+=sys.exc_info()[0]
                                f.write(filename+sys.exec_info()[0])
                                sendMail(msg,"VF-campaign",mail.get("From"))
                                break
                            if num !=None:
                                msg+=str(num)+" clients have been imported from "+filename+"\n"
                            else:
                                msg=filename+" had the wrong format. Fix this and try again."
                            imported=True
                            f.write(filename+" "+str(num)+"\n")
                        if os.path.splitext(filename)[1]==".xls" and not_imported(mail,i+1):
                            msg+=filename+": Files need to be in csv format to be imported. Save the file in this format and resend the email"
            if not_imported(mail,i+1) and imported:
                sendMail(msg,"VF-campaign",mail.get("From"))
                emailen={'mail_number':i+1,'date':mail.get('Date'),'subject':mail.get('Subject'),'from_address':mail.get("From")}
            
                db.insert("email",emailen)
                            
    numMessages0=numMessages1
    time.sleep(30)
    
