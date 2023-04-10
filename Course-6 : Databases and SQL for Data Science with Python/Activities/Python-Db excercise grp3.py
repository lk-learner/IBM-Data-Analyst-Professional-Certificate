#!/usr/bin/env python
# coding: utf-8

# In[2]:


# These libraries are pre-installed in SN Labs. If running in another environment please uncomment lines below to install them:
get_ipython().system('pip install --force-reinstall ibm_db==3.1.0 ibm_db_sa==0.3.3')
# Ensure we don't load_ext with sqlalchemy>=1.4 (incompadible)
# !pip uninstall sqlalchemy==1.4 -y && pip install sqlalchemy==1.3.24
# !pip install ipython-sql


# In[ ]:


import ibm_db
import pandas as pd
import ibm_db_dbi


# In[ ]:


#Replace the placeholder values with your actual Db2 hostname, username, and password:
dsn_hostname = "hostname"
dsn_uid = "usrname"
dsn_pwd = "pwd"

dsn_driver = "{IBM DB2 ODBC DRIVER}"
dsn_database = "BLUDB"            # e.g. "BLUDB"
dsn_port =     "31249"         # e.g. "32733" 
dsn_protocol = "TCPIP"            # i.e. "TCPIP"
dsn_security = "SSL"              #i.e. "SSL"


# In[ ]:


#DO NOT MODIFY THIS CELL. Just RUN it with Shift + Enter
#Create the dsn connection string
dsn = (
    "DRIVER={0};"
    "DATABASE={1};"
    "HOSTNAME={2};"
    "PORT={3};"
    "PROTOCOL={4};"
    "UID={5};"
    "PWD={6};"
    "SECURITY={7};").format(dsn_driver, dsn_database, dsn_hostname, dsn_port, dsn_protocol, dsn_uid, dsn_pwd,dsn_security)

#print the connection string to check correct values are specified
print(dsn)


# In[ ]:


#DO NOT MODIFY THIS CELL. Just RUN it with Shift + Enter
#Create database connection

try:
    conn = ibm_db.connect(dsn, "", "")
    print ("Connected to database: ", dsn_database, "as user: ", dsn_uid, "on host: ", dsn_hostname)

except:
    print ("Unable to connect: ", ibm_db.conn_errormsg() )


# In[ ]:


pconn = ibm_db_dbi.Connection(conn)


# In[ ]:


# Exercise 1: Connect to your database server and print its version

server = ibm_db.server_info(conn)
print("DBMS VERSION: ",server.DBMS_VER)


# In[ ]:


# Exercise 2: Fetch Hospital and Doctor Information using hospital Id and doctor Id
docId = input("Write the doctor Id: ")
hosId = input("Write the hospital Id: ")


# In[28]:


createQuery = "SELECT d.DOCID, d.DOCNAME, d.HOSPITALID, h.NAME, h.BEDCOUNT FROM DOCTOR d JOIN HOSPITAL h ON d.HOSPITALID=h.ID WHERE d.DOCID={0} AND h.ID={1};".format(docId, hosId)
Data = pd.read_sql(createQuery, pconn)
Data


# In[ ]:


# Exercise 3: Get the list Of doctors as per the given specialty and salary
speciality = input("Write the speciality: ")
salary = input("Salary should be greater than :")
createQuery = "SELECT * FROM DOCTOR WHERE SPECIALITY='{0}' AND SALARY>={1};".format(speciality, salary)
Data = pd.read_sql(createQuery, pconn)
Data


# In[ ]:


# Exercise 4: Get a list of doctors from a given hospital
hospital = input("Indicate hospital Id: ")
createQuery = "SELECT D.DOCID,	D.DOCNAME,	D.JOININGDATE,	D.SPECIALITY,	D.EXP,	D.SALARY FROM DOCTOR D LEFT JOIN HOSPITAL H ON D.HOSPITALID = H.ID WHERE H.ID = {0}".format(hospital)
Data = pd.read_sql(createQuery, pconn)
Data


# In[ ]:


# Exercise 5: Update doctor experience in years
docId = input("Write the doctor Id: ")
exp = input('Write doctor experience in Years: ')
createQuery = "UPDATE DOCTOR SET EXP={0} WHERE DOCID={1};".format(exp, docId)
stmt = ibm_db.exec_immediate(conn ,createQuery)


# In[41]:


createQuery = "SELECT * FROM DOCTOR"
Data = pd.read_sql(createQuery, pconn)
Data


# In[ ]:




