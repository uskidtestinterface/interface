*** Settings ***
Resource          ../Variables/URL.robot

*** Keywords ***
url
    [Arguments]    ${api}    ${paramkey1}    ${paramvalue1}    ${paramkey2}=None    ${paramvalue2}=None
    ${url1}    catenate    SEPARATOR=    ${api}    ?
    ${url2}    catenate    SEPARATOR=    ${url1}    ${paramkey1}
    ${url3}    catenate    SEPARATOR=    ${url2}    =
    ${url4}    catenate    SEPARATOR=    ${url3}    ${paramvalue1}
    ${url5}    catenate    SEPARATOR=    ${url4}    &
    ${url6}    catenate    SEPARATOR=    ${url5}    ${paramkey2}
    ${url7}    catenate    SEPARATOR=    ${url6}    =
    ${url8}    catenate    SEPARATOR=    ${url7}    ${paramvalue2}
    set global variable    ${url}    ${url8}
    Log    ${url}
    [Return]    ${url}
