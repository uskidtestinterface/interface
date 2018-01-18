*** Settings ***
Library           RequestsLibrary
Library           json
Resource          ../Params/params.robot
Resource          ../Variables/page_variables.robot
Resource          ../Variables/URL.robot
Library           requests
Library           DateTime
Library           TestRF

*** Keywords ***
Postapi
    [Arguments]    ${account}    ${accountvalue}    ${password}    ${passwordvalue}    ${教师登录api}    ${Tokenkey}=None
    ...    ${Tokenvalue}=None
    &{params}    Create Dictionary    ${account}=${accountvalue}    ${password}=${passwordvalue}    ${Tokenkey}=${Tokenvalue}
    &{headers}=    Create Dictionary    Content-Type=application/json
    comment    application/x-www-form-urlencoded
    ${response}=    Post Request    api    ${教师登录api}    data=${params}    headers=${headers}
    Log    ${response.content}
    set global variable    ${resp}    ${response.content}
    [Return]    ${resp}

Token
    ${JsonA}    json.loads    ${resp}
    Log    ${JsonA['data']['token']}
    ${Token}    set variable    ${JsonA['data']['token']}
    Log    ${Token}
    set global variable    ${Tokenvalue}    ${Token}
    [Return]    ${Tokenvalue}

Getapi
    [Arguments]    ${api}    ${paramkey1}    ${paramvalue1}    ${paramkey2}=None    ${paramvalue2}=None
    url    ${获取近30天课程信息api}    ${paramkey1}    ${paramvalue1}    ${Tokenkey}    ${Tokenvalue}
    ${aaa}    RequestsLibrary.Get Request    api    ${url}
    Log    ${aaa.content}
    set global variable    ${getresp}    ${aaa.content}
    [Return]    ${getresp}

Delapi
    [Arguments]    ${开课id}    ${开课idvalue}    ${Tokenkey}    ${Tokenvalue}    ${教师添加预约api}
    &{params}    Create Dictionary    ${开课id}=${开课idvalue}    ${Tokenkey}=${Tokenvalue}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${re}=    Delete Request    api    ${教师添加预约api}    data=${params}    headers=${headers}
    Log    ${re.content}
    set global variable    ${resp}    ${re.content}
    [Return]    ${resp}

Now
    ${a}    mytime
    Log    ${a}

Putapi
    &{params}    Create Dictionary    ${nicknamekey}=${nicknamevalue}    ${messageSettingkey}=${messageSettingvalue}    ${contactPhonekey}=${contactPhonevalue}    ${contactEmailkey}=${contactEmailvalue}    ${expressAddresskey}=${expressAddressvalue}
    ...    ${sparePhonekey}=${sparePhonevalue}     ${usingPhonekey}=${usingPhonevalue}    ${addresskey}=${addressvalue}    ${zipCodekey}=${zipCodevalue}    ${Tokenkey}=${Tokenvalue}
    &{headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${re}=    Put Request    api    ${教师添加预约api}    data=${params}    headers=${headers}
    Log    ${re.content}
    set global variable    ${resp}    ${re.content}
    [Return]    ${resp}

Session
    Create Session    api    ${backend_URI}
