
import db
import sys

db=db.DB()

f=open("database/zones.csv","r")
f.readline()
for l in f:
    l=l.split(',')
    camp_loc={'location_id':l[0][1:-1],'name':l[1][1:-2],'location_type':'zone','belongs_to':None}
    print camp_loc
    db.insert('camp_locations',camp_loc)
f.close()
f=open("database/districts.csv","r")
f.readline()
for l in f:
    l=l.split(',')
    
    camp_loc={'location_id':l[0],'location_type':'district','name':l[1][1:-1],'belongs_to':l[2][1:-2]}
    print camp_loc
    db.insert('camp_locations',camp_loc)
f.close()


