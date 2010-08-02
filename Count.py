import pg
import dbConfig
import db
class Count:
    def __init__(self,zone="All",district="All",site="All"):
        self.zone=zone
        self.district=district
        self.site=site
        self.db=db.db()
        #make a list of all the sites we want:
        self.list=[]
        if site!="All":
            self.sub_locations=[(site,'site')]
            self.list=[site]
        else:
            if district !="All":
                res=self.db.query("SELECT location_id from camp_locations where belongs_to='"+district+"'").getresult()
                
                self.list=[i[0] for i in res]
                self.sub_locations=[(i[0],'site') for i in res]
                if len(self.list)==0:#temporary fix
                        self.list=['bjarne']
            else:
                if zone!="All":
                    res=self.db.query("SELECT location_id from camp_locations where belongs_to='"+zone+"'").getresult()
                    dists=[i[0] for i in res]
                    self.sub_locations=[(i[0],'district') for i in res]
                    for d in dists:
                        
                        res=self.db.query("SELECT location_id from camp_locations where belongs_to='"+d+"'").getresult()
                        self.list+=[i[0] for i in res]
                    if len(self.list)==0:#temporary fix
                        self.list=['bjarne']
                else:
                    res=self.db.query("SELECT location_id from camp_locations where location_type='zone'").getresult()
                    self.sub_locations=[(i[0],'zone') for i in res]
        
        if len(self.list)==0:
            self.locations='1=1'
        else:
            self.locations="site_id in ('"+"','".join(self.list)+"')"
        self.count()
    def count(self):
        
        #The total numbers for all days
        #Total:
        
        
      
        self.total={}
        self.total_wp={}

        tested = self.db.query("SELECT date,count(id) from clients where "+self.locations+" GROUP BY date").getresult()
        
        positive = self.db.query("SELECT date,count(id) from clients where hiv_result=1 and "+self.locations+" GROUP by date").getresult()
        for i in range(len(tested)):
           
            self.total[tested[i][0]]={}
            self.total[tested[i][0]]['Tested']=tested[i][1]
            self.total[positive[i][0]]['Positive']=positive[i][1]
            self.total_wp[tested[i][0]]={}
            self.total_wp[tested[i][0]]['Tested']=tested[i][1]
            self.total_wp[positive[i][0]]['Positive']=positive[i][1]
            if tested[i][1]!=0:
                self.total_wp[positive[i][0]]['% HIV Prevalence']=positive[i][1]/float(tested[i][1])*100
            else:
                self.total_wp[positive[i][0]]['% HIV Prevalence']=0
            
        #Sex:

        male_tested=self.db.query("SELECT count(id) from clients where sex=1 and "+self.locations).getresult()[0][0]
        female_tested=self.db.query("SELECT count(id) from clients where sex=2 and "+self.locations).getresult()[0][0]


        male_positive=self.db.query("SELECT count(id) from clients where sex=1 and hiv_result=1 and "+self.locations).getresult()[0][0]
        female_positive=self.db.query("SELECT count(id) from clients where sex=2 and hiv_result=1  and "+self.locations).getresult()[0][0]
        self.sex={'Male':{'Tested':male_tested,'Positive':male_positive},'Female':{'Tested':female_tested,'Positive':female_positive}}
        self.sex_wp={}
        if male_tested!=0:
            self.sex_wp['Male']={'Tested':male_tested,'Positive':male_positive,'% HIV Prevalence':male_positive/float(male_tested)*100}
        else:
             self.sex_wp['Male']={'Tested':male_tested,'Positive':male_positive,'% HIV Prevalence':0}

        if female_tested!=0:
            self.sex_wp['Female']={'Tested':female_tested,'Positive':female_positive,'% HIV Prevalence':female_positive/float(female_tested)*100}

        else:
            self.sex_wp['Female']={'Tested':female_tested,'Positive':female_positive,'% HIV Prevalence':0}
        # Age
        boundaries=[(None,15),(15,19),(20,24),(25,29),(30,34),(35,39),(40,44),(45,49),(50,55),(55,None)]
        self.age={}
        for b in boundaries:
            if b[0]==None:
                string='0-'+str(b[1])
                b0=0
                b1=b[1]-1
            elif b[1]==None:
                string='> '+str(b[0])
                b0=b[0]+1
                b1=200
            else:
                string=str(b[0])+'-'+str(b[1])
                b0=b[0]
                b1=b[1]
            self.age[string]={}
            self.age[string]['Tested']=self.db.query("SELECT count(id) from clients where age >= "+str(b0)+" and age <= "+str(b1)+" and "+self.locations).getresult()[0][0]
            self.age[string]['Positive']=self.db.query("SELECT count(id) from clients where hiv_result=1 and age >= "+str(b0)+" and age <= "+str(b1)+" and "+self.locations).getresult()[0][0]
            if self.age[string]['Tested']!=0:
                self.age[string]['% HIV Prevalence']=self.age[string]['Positive']/float(self.age[string]['Tested'])*100
            else:
                self.age[string]['% HIV Prevalence']=0
        self.age_tested={}
        self.age_prev={}
        for a in self.age:
            self.age_tested[a]=self.age[a]['Tested']
        for a in self.age:
            self.age_prev[a]=self.age[a]['% HIV Prevalence']
            #Geographical dist based on all sub-locations
        self.geo={}
        
        for loc in self.sub_locations:
            if loc[1]=='site':
                name=self.db.query("SELECT name from camp_locations where location_id='"+loc[0]+"'").getresult()[0][0]
                self.geo[name]={}
                self.geo[name]['Tested'] = self.db.query("SELECT count(id) from clients where site_id='"+loc[0]+"'").getresult()[0][0]

                self.geo[name]['Positive'] = self.db.query("SELECT count(id) from clients where hiv_result=1 and site_id='"+loc[0]+"'").getresult()[0][0]
                if self.geo[name]['Tested']!=0:
                    self.geo[name]['% HIV Prevalence']=self.geo[name]['Positive']/float(self.geo[name]['Tested'])*100
                else:
                    self.geo[name]['% HIV Prevalence']=0
                
            if loc[1]=='district':
                name=self.db.query("SELECT name from camp_locations where location_id='"+loc[0]+"'").getresult()[0][0]
                sites=self.db.query("SELECT location_id from camp_locations where belongs_to='"+loc[0]+"'").getresult()
                sites=[s[0] for s in sites]
                sites="site_id in ('"+"','".join(sites)+"')"
                self.geo[name]={}
                self.geo[name]['Tested'] = self.db.query("SELECT count(id) from clients where "+sites).getresult()[0][0] 
                self.geo[name]['Positive'] = self.db.query("SELECT count(id) from clients where hiv_result=1 and "+sites).getresult()[0][0]
                if self.geo[name]['Tested']!=0:
                    self.geo[name]['% HIV Prevalence']=self.geo[name]['Positive']/float(self.geo[name]['Tested'])*100
                else:
                    self.geo[name]['% HIV Prevalence']=0
            if loc[1]=='zone':

                name=self.db.query("SELECT name from camp_locations where location_id='"+loc[0]+"'").getresult()[0][0]
                districts=self.db.query("SELECT location_id from camp_locations where belongs_to='"+loc[0]+"'").getresult()

                sites=[]
                for d in districts:
                    
                    sites+=self.db.query("SELECT location_id from camp_locations where belongs_to='"+d[0]+"'").getresult()

                sites=[s[0] for s in sites]

                sites="site_id in ('"+"','".join(sites)+"')"

                self.geo[name]={}
                self.geo[name]['Tested'] = self.db.query("SELECT count(id) from clients where "+sites).getresult()[0][0] 
                self.geo[name]['Positive'] = self.db.query("SELECT count(id) from clients where hiv_result=1 and "+sites).getresult()[0][0]
                
                if self.geo[name]['Tested']!=0:
                    self.geo[name]['% HIV Prevalence']=self.geo[name]['Positive']/float(self.geo[name]['Tested'])*100
                else:
                    self.geo[name]['% HIV Prevalence']=0
if __name__=="__main__":
    c=Count("D","All","All")
    print c.geo
 
