*** Settings ***
Library           DatabaseLibrary

*** Keywords ***
ConnectDatabase
    Connect To Database Using Custom params    pymysql    database='uskid',user='uskid',password='uskid',host='172.16.3.2', port=3306
    ${a}    query    select * from uskid_campus
    Log    ${a}
    Disconnect From Database
