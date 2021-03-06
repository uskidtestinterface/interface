*** Settings ***
Library           RequestsLibrary
Library           json
Resource          ../Params/params.robot
Resource          ../Variables/page_variables.robot
Resource          ../Variables/URL.robot
Library           requests

*** Keywords ***
Postapi
    [Arguments]    ${account}    ${accountvalue}    ${password}    ${passwordvalue}    ${教师登录api}    ${Tokenkey}=None
    ...    ${Tokenvalue}=None
    Create Session    api    http://api.uskid.tech
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
    RequestsLibrary.Get request    url    ${获取近30天课程信息api}
