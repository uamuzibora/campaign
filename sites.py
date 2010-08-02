
import db
import sys

db=db.db()

f=open(sys.argv[1],"r")
f.readline()
for l in f:
    l=l.split(';')
    #print l
    #print l[8]                                                                        
    camp_loc={'location_id':l[5][1:-1],'name':l[6][1:-1],'site_type':l[7][1:-1],'location_type':'site','latitude':l[8][1:-1],'longitude':l[9][1:-2]}
    camp_loc['belongs_to']=l[2]
    db.insert('camp_locations',camp_loc)
f.close()
db.close()
