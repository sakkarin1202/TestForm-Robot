*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${FIRST_NAME_ENG}       วิค
${ID_CARD}              123456789012
${PASSWORD}             password123
${MOBILE}               012345678
${EMAIL}                test@webmail.ru.ac.th

${RESULT_FIRST_NAME_ENG}    กรุณากรอกชื่อเป็นภาษาอังกฤษเท่านั้น
${RESULT_ID_CARD}           กรุณากรอกหมายเลขบัตรประชาชน 13 หลัก เป็นตัวเลขทั้งหมด
${RESULT_PASSWORD}          รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร ประกอบด้วยอักษรตัวเล็ก อักษรตัวใหญ่ และตัวเลข
${RESULT_MOBILE}            กรุณากรอกเบอร์โทรศัพท์ 10 หลักเท่านั้น
${RESULT_EMAIL}             กรุณากรอกอีเมลที่มีโดเมน @webmail.npru.ac.th เท่านั้น

*** Test Cases ***
Search Google and Verify Results
    [Documentation]    Test case to search Google and verify results
    [Tags]              search
    Open Google ReactForm
    Input firstnameeng
    Input IDCard
    Input Password
    Input Mobile
    Input Email
    Verify Results

*** Keywords ***
Open Google ReactForm
    Open Browser    http://localhost:5173/    ${BROWSER}
    Maximize Browser Window

Input firstnameeng
    Input Text    id=firstnameEng    ${FIRST_NAME_ENG}
Input IDCard
    Input Text    name=idCard    ${ID_CARD}

Input Password
    Input Text    id=password    ${PASSWORD}
Input Mobile
    Input Text    name=mobile    ${MOBILE}

Input Email
    Input Text    id=email    ${EMAIL}
Verify Results
    Wait Until Page Contains    ${RESULT_FIRST_NAME_ENG}    10s
    Page Should Contain        ${RESULT_FIRST_NAME_ENG}
    Wait Until Page Contains    ${RESULT_ID_CARD}    10s
    Page Should Contain        ${RESULT_ID_CARD}
    Wait Until Page Contains    ${RESULT_PASSWORD}    10s
    Page Should Contain        ${RESULT_PASSWORD}
    Wait Until Page Contains    ${RESULT_MOBILE}    10s
    Page Should Contain        ${RESULT_MOBILE}
    Wait Until Page Contains    ${RESULT_EMAIL}    10s
    Page Should Contain        ${RESULT_EMAIL}

