*** Settings ***
Resource          ../Variables/URL.robot
Resource          ../Variables/datafromuskid.robot

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

三段式url
    [Documentation]    /:id,表示teacher_timeslot表中的teacherid字段
    ${url1}    catenate    SEPARATOR=    ${api}    ${获取教师预约课数api}
    ${url2}    catenate    SEPARATOR=    ${url1}    /:
    ${url3}    catenate    SEPARATOR=    ${url2}    ${teacherId}
    ${url4}    catenate    SEPARATOR=    ${url3}    ${获取教师预约课数_end}
    ${url5}    catenate    SEPARATOR=    ${url4}    &
    set global variable    ${url}    ${url5}
    Log    ${url}

冒号结尾url
    ${url1}    catenate    SEPARATOR=    ${api}    ${获取指定课程信息api}
    ${url2}    catenate    SEPARATOR=    ${url1}    /:
    ${url3}    catenate    SEPARATOR=    ${url2}    ${bookingId}
    set global variable    ${url}    ${url3}
    Log    ${url}
