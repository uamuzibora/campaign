import sys
import os.path
import os
import datetime
import db
import re
import StringIO


fields=['counsellor','return_visit','new_code','client_code','partner_code','mother_maiden_name','sex','age','occupation',' education','martial_status','seen_as','pregnant','service_requiered','reason','information','ever_sex','hetrosexual_partners','homosexual_partners','condom_steady_patner','condom_non_steady_patner','condom_last_sex','not_tested_why','tested_before','hiv_test_1','hiv_test_2','tie_breaker','hiv_result','syphilis_result','couple_dicordant','condoms_given','refered_to'];

fields_pat=['vfcc','surname','forenames','date_of_birth','sex','home','telephone_number','location_id','nearest_school','nearest_health_centre','marital_status_id','treatment_supporter_name','treatment_supporter_relationship','treatment_supporter_address','treatment_supporter_telephone_number']



class importDB:
    def __init__(self):
        self.db=db.db()
    def unique(self,table,column,entry):
        ret=False
        if len(self.db.query("SELECT "+column+" FROM "+table+" where "+column+" = '"+str(entry)+"'").getresult())==0:
            ret=True
        return ret

    def checkFormat(self,f):
        ret=None
        lines=f.split("\n")
        
        length=len(lines[0].split(','))
        
        if length==32:
            ret='register'
        elif length==16:
            ret='positive'
        return ret
        
    def __call__(self,f):
     
     
        t=self.checkFormat(f.getvalue())
      
        if t=="register":
       
            return self.register(f)
        elif t=="positive":
            return self.positive(f)
        else:
            return None


    def positive(self,f):
        created=datetime.datetime.strftime(datetime.datetime.today(),'%Y-%m-%d %H:%M:%S') 
        header=f.readline().split(',')
        header={'test_site_id':header[5]}
        date=f.readline().split(',')[1]
        header['date']=date

    
        s=f.readline().split(',')

        i=0
        for line in f:


            l=line[:-1].split(',')
            pat={}
            med_inf={}

            for n in range(len(l)):
                if n<len(fields_pat):
                    pat[fields_pat[n]]=l[n];
                
            pat['created']=created
            pat['modified']=created
            pat['vf_test_site']=header['test_site_id']
            med_inf['created']=created
            med_inf['modified']=created
            med_inf['patient_source_id']=6#VF
            med_inf['hiv_positive_date']=header['date']
            med_inf['hiv_positive_test_location_id']=header['test_site_id']
            if pat['vfcc'] and self.unique('patients','vfcc',pat['vfcc']):
             
                ins = self.db.insert('patients',pat)
                pid=self.db.query('SELECT last_value from patients_pid_seq').getresult()[0][0]
                med_inf['pid']=pid
                ins=self.db.insert('medical_informations',med_inf)
                i+=1
        return i, None
    def register(self,f):

        created=datetime.datetime.strftime(datetime.datetime.today(),'%Y-%m-%d %H:%M:%S') 
        clients=[]
        reason=[]
        information=[]
        referal=[]
       
        head=f.readline().split(',')

        header={'site_id':head[1][1:-1]}
        header2=f.readline().split(',')

        header['date']=header2[1]
        header['care_packs']=header2[3][1:-1]
        header['hiv_tests']=header2[5][1:-1]
        #print header

        s=f.readline().split(',')
        
        qu=self.db.query("SELECT id FROM camp_locations where location_id='"+header['site_id']+"'").getresult()
        
        number=0
        
        if len(qu)>0:# We have a site id that exists

            for line in f:
                

                l=line[:-1].split(',')
                dct={'date':header['date'],'site_id':header['site_id']}
                #print l
                for n in range(len(l)):
                    if fields[n]=='reason':

                        ids=l[n].split(';')
                        for id in ids:
                            id =id.strip('"')
                            if id:
                                reason.append({'reason_id':int(id)})

                    elif fields[n]=='information':               
                        ids=l[n].split(';')
                        for id in ids:
                            id =id.strip('"')
                            if id:
                                information.append({'information_id':int(id)})

                    elif fields[n]=='refered_to':               
                        ids=l[n].split(';')
                        for id in ids:
                            id =id.strip('"')
                            if id:
                                referal.append({'referal_id':int(id)})
                    else:
                        if len(l[n])>0 and l[n][0]=='"':
                            dct[fields[n]]=l[n][1:-1];
                        else:
                            dct[fields[n]]=l[n];
                dct['created']=created
                #print dct
                if dct['client_code'] and self.unique("clients","client_code",dct["client_code"]):
            
                    ins = self.db.insert('clients',dct)
                    client_id=self.db.query('SELECT last_value from clients_id_seq').getresult()[0][0]
                    for r in reason,information,referal:
                        for k in r:
                            k['client_id']=client_id
                            k['created'] = created
                    for r in reason:
                        self.db.insert('reason',r)
                    for r in information:
                        self.db.insert('information',r)
                    for r in referal:
                        self.db.insert('referal',r)
                    del reason[:]
                    del information[:]
                    del referal[:]
                    number+=1
                    

            self.db.insert('logistics',header)
        return number,None
                
        


if __name__=="__main__":
    try:
        filename=sys.argv[1]
        files=[]#List of all files to be imported
        if os.path.splitext(filename)[1]!='.csv':
            os.chdir(filename);
            fs=os.listdir(os.getcwd())
            for f in fs:
                if os.path.splitext(f)[1]=='.csv':
                    files.append(f)   
        #Read all csv files in directory
        else:
            files=[filename]
    except:
        print "Need to specify filename as second command line parameter"
#Import all the data
#
    db=importDB()
    #print db.unique("clients","client_code",123)
    for f in files:
        fi=open(f,'r')
        s=StringIO.StringIO(fi.read())
 
        print db(s)


