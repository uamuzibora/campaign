import db as database

def get_locations(zone,district):
    db=database.DB()
    sites=[]
    dists=[]
    #Get all sites and districts
    if district!="All":
        sites=db.query_list("SELECT location_id,name from camp_locations where belongs_to=%s",district)
        if zone!="All":
            districts=db.query_list("SELECT location_id,name from camp_locations where belongs_to=%s",zone)
        else:
            districts=db.query_list("SELECT location_id,name from camp_locations where location_type='district' ")
    else:
        if zone!="All":
            
            districts=db.query_list("SELECT location_id,name from camp_locations where belongs_to=%s",zone)
            for d in districts:
                sites+=db.query_list("SELECT location_id,name from camp_locations where belongs_to=%s",d[0])

        else:
            districts=db.query_list("SELECT location_id,name from camp_locations where location_type='district' ")
            
            sites=db.query_list("SELECT location_id,name from camp_locations where location_type='site'")

    
    zones=db.query_list("SELECT location_id,name from camp_locations where location_type='zone'")
    return zones,districts,sites

if __name__=='__main__':
    print get_locations('D','All')
