
import random
#from numpy.random import *
sex=['Male','Female']
letters=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
bol=[0,1]
dust04=[0,1,2,3,4,9]
dust03=[0,1,2,3,9]
dust13=[1,2,3,9]
dust02=[0,1,2,9]
dust01=[0,1,9]
dustehue14=[1,2,3,4,8]
sites=["A01002"]
dates=["12/07/2010"]
number_of_clients_per_site=200


for s in sites:
    c=s+"C"+str(random.randint(0,13))
    n=0
    for d in dates:

        
        print d,s+'-'+str(n)+".csv"
        f=open(s+'-'+str(n)+".csv","w")
        f.write('"Test Site ID","'+s+'",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'+"\n")
        f.write('"Date",'+d+',"Care Packs left:",'+str(random.randint(100,500))+',"HIV tests left",'+str(random.randint(100,500))+',,,,,,,,,,,,,,,,,,,,,,,,,,'+"\n")
       
        f.write('"Counsellor","Return Visit","New Code","Client code","Partner Code","Mother\'s Maiden name","Sex","Age","Occupation","Education","Marital Status","Client Seen as","Client Pregnant","Service Required","Why here today","How did the client learn about this service","Has client ever had sex","Heterosexual parters last 12 months","Homosexual parters last 12 months","Condom used in last 12 months steady partner","Condom used in last 12 months Non-steady partner","Condom used last sex","If not testeed, why not?","Has client been tested before?","HIV test no. 1 result","HIV test no2. Result","Tie breaker test","HIV result","Syphilis testing","Couple discordant","Condoms given","Referred to"'+"\n")
        for i in range(number_of_clients_per_site):

            f.write('"'+c+'",'+str(random.randint(0,1)))

            random.shuffle(letters)
            random.shuffle(dust04)
            random.shuffle(dust03)
            random.shuffle(dust13)
            f.write(","+str(random.randint(0,1))+',"'+s+"-"+str(i+number_of_clients_per_site*n)+'",,"')
            f.write(''.join(letters[:6])+'",'+str(random.randint(1,2))+","+str(random.randint(15,65)))
            f.write(","+str(random.randint(0,4))+","+str(random.randint(0,3))+","+str(random.randint(0,6)))
            f.write(","+str(random.randint(1,4))+","+str(random.randint(0,2))+","+str(random.randint(1,3))+",")
            f.write(";".join([str(random.randint(0,21)) for i in range(random.randint(0,5))])+",")
            f.write(";".join([str(random.randint(0,12)) for i in range(random.randint(0,5))])+",")
            f.write(str(random.randint(0,1))+","+str(random.randint(0,12))+","+str(random.randint(0,12))+",")
            f.write(str(dust04[0])+","+str(dust04[1])+","+str(dust03[0])+","+str(dust13[0])+",")
            f.write(str(random.randint(0,3))+",")
            random.shuffle(dust02)
            f.write(str(dust02[0])+",")
            random.shuffle(dust02)
            f.write(str(dust02[0])+",")
            random.shuffle(dust01)
            f.write(str(dust01[0])+",")
            random.shuffle(dust01)
            f.write(str(dust01[0])+",")
            random.shuffle(dust01)
            f.write(str(dust01[0])+",")
            random.shuffle(dust01)
            f.write(str(dust01[0])+",")
            random.shuffle(dustehue14)
            f.write(str(dustehue14[0])+",")
            f.write(";".join([str(random.randint(0,12)) for i in range(random.randint(0,5))])+"\n")
 
        n+=1
        
