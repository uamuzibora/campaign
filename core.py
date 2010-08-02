import db as database

def get_locations(zone,district):
    db=database.db()
    sites=[]
    dists=[]
    #Get all sites and districts
    if district!="All":
        sites=db.query("SELECT location_id,name from camp_locations where belongs_to='"+district+"'").getresult()
        if zone!="All":
            districts=db.query("SELECT location_id,name from camp_locations where belongs_to='"+zone+"'").getresult()
        else:
            districts=db.query("SELECT location_id,name from camp_locations where location_type='district' ").getresult()
    else:
        if zone!="All":
            
            districts=db.query("SELECT location_id,name from camp_locations where belongs_to='"+zone+"'").getresult()
            for d in districts:
                sites+=db.query("SELECT location_id,name from camp_locations where belongs_to='"+d[0]+"'").getresult()

        else:
            districts=db.query("SELECT location_id,name from camp_locations where location_type='district' ").getresult()
            
            sites=db.query("SELECT location_id,name from camp_locations where location_type='site'").getresult()

    
    zones=db.query("SELECT location_id,name from camp_locations where location_type='zone'").getresult()
    return zones,districts,sites

if __name__=='__main__':
    print get_locations('D','All')
