import psycopg2
import psycopg2.extras
from dbConfig import *


class DB:
    def __init__(self):
        if password:
            self.connection=psycopg2.connect(host=host,user=user,password=password,database=database)
        else:#for ident
            
            self.connection=psycopg2.connect(user=user,database=database)
        self.cursor=self.connection.cursor()

    def insert(self,table,dictionary):
        """ Inserts a dictinoary into the table, if the dictinoary is a list of dictinonaries it inserts them all"""
        cursor=self.connection.cursor()
        if type(dictionary)==dict:
            statement= "INSERT INTO %s " % table
            statement += "( %s ) " % ','.join(dictionary.keys())
            statement+= "VALUES (%("+ ")s,%(".join(dictionary.keys())+")s)"
           
            cursor.execute(statement,dictionary)
        else:            
            statement= "INSERT INTO %s " % table
            statement += "( %s ) " % ','.join(dictionary[0].keys())
            statement+= "VALUES (%("+ ")s,%(".join(dictionary[0].keys())+")s)"

            cursor.executemany(statement,dictionary)
        self.connection.commit()
        cursor.close()
    
    def in_db(self,table,column,entry):
        cursor=self.connection.cursor()
        ret=False
       
        cursor.execute('SELECT %s FROM %s where %s='%(column,table,column)+"%s",(entry,))

        if len(cursor.fetchall())>0:
            ret=True
        cursor.close()
        return ret
    def query_list(self,query,variables=None):
        
        cursor=self.connection.cursor()
        if variables!=None:
            if type(variables)!=tuple:
                cursor.execute(query,(variables,))
            else:
                   cursor.execute(query,variables)
        else:
            cursor.execute(query)
        ret =cursor.fetchall()
        cursor.close()
        return ret
    def query_dict(self,query,variables=None):
        cursor=self.connection.cursor(cursor_factory=psycopg2.extras.DictCursor)
        if variables!=None:
            cursor.execute(query,variables)
        else:
            cursor.execute(query)
        ret =cursor.fetchall()
        cursor.close()
        return ret
if __name__=='__main__':
    db=DB()
    
    print db.query_dict("SELECT * from email where mail_number=%s",(1,))
    print db.query_list('SELECT last_value from patients_pid_seq')[0][0]

