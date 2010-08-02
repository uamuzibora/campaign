from pg import *

host='host'
login='username'
password='password'
database='database'


def db():
    return DB(database,host,-1,None,None,login,password); 
