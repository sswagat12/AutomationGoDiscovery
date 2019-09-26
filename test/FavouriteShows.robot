*** Settings ***
Documentation    Suite description

Library    Selenium2Library
Library    Collections
Library    ..\\ShowTitlesAndDurationScrapped.py

*** Variables ***
${LOGIN_URL}    https://go.discovery.com/
${BROWSER}    Chrome
${PopularShows}     //*[@id="react-root"]/div/div[1]/section[9]/div/div/h2
${Show}    https://go.discovery.com/tv-shows/deadliest-catch/
${ShowMore}    //*[@id="react-root"]/div/div[1]/main/section[2]/div/ul/li[4]/button
${ShowMoreAgain}    //*[@id="react-root"]/div/div[1]/main/section[2]/div/ul/li[14]/button
${title}
${duration}
${ShowTitleList}
${ShowTitleDuration}



*** Test Cases ***
Valid_URL_Open
    Open Browser To Login Page
    Maximize Browser Window
Navigate_To_Popular_Shows
    Scroll Element Into View    ${PopularShows}
    Wait Until Element is visible    ${PopularShows}
    Set Focus To Element    ${PopularShows}

Navigating_To_Last_Video
    Click Element    xpath=//*[@id="react-root"]/div/div[1]/section[9]/div/div/div[1]/div/div[1]/div[2]/div/i
    : FOR    ${INDEX}    IN RANGE    0    13
    \    Click Element    xpath=//*[@id="react-root"]/div/div[1]/section[9]/div/div/div[1]/div/div[1]/div[3]/div/i
    Close All Browsers

Explore_The_Show
    Exploring Show
    Maximize Browser Window
    Wait Until Element is visible    ${ShowMore}
    Scroll Element Into View    ${ShowMore}
    Wait Until Element is visible    ${ShowMore}
    Set Focus To Element    ${ShowMore}
    Click Element    xpath=${ShowMore}
    Scroll Element Into View    ${ShowMoreAgain}
    Wait Until Element is visible    ${ShowMoreAgain}
    Set Focus To Element    ${ShowMoreAgain}
    Click Element    xpath=${ShowMoreAgain}
Show_Titles_And_Duration_Scrapped
    Log To Console    \n Started Scrapping Contents
    Log To Console     ****************************
    @{ShowTitleList}=    Create List
    : For    ${i}     IN RANGE    1    24
    \    ${title}=     Get Text    xpath =//*[@id="react-root"]/div/div[1]/main/section[2]/div/ul/li[${i}]/div[1]/div[1]/div/a/div[2]/p[2]
    \    Append To List    ${ShowTitleList}    ${title}
    :FOR  ${item}  IN  @{ShowTitleList}
    \    log to console    ${item}
#    Wait Until Element is visible    //*[@id="react-root"]/div/div[1]/main/section[2]/div/ul/li[${i}]/div[1]/div[1]/div/a/div[2]/p[2]

    @{ShowTitleDuration}=    Create List
    : For    ${i}     IN RANGE    1    24
    \    ${duration}=     Get Text    xpath =//*[@id="react-root"]/div/div[1]/main/section[2]/div/ul/li[${i}]/div[1]/div[1]/div/a/div[2]/div/div/p
    \    Append To List    ${ShowTitleDuration}    ${duration}
    :FOR  ${item}  IN  @{ShowTitleDuration}
    \    log to console    ${item}
    Close All Browsers
    &{params}=    Create Dictionary    showTitleList=${ShowTitleList}    showTitleDuration=${ShowTitleDuration}
    ${status}=    Show Titles    ${params}
#    run keyword if      ${status} != 1    FAIL
#    x()
*** Keywords ***
#Validate
#    [Arguments]    ${status}    ${msg}
#    Return From Keyword if    ${status} != 0
#    FAIL    \n${msg}
#
#Validate Out
#    [Arguments]    ${status}    ${msg}
#    Return From Keyword if    ${status} == ${None}
#    FAIL    \n${msg}
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute Javascript    window.scrollTo(${x_location}, ${y_location})
Exploring Show
    Open Browser    ${Show}    ${BROWSER}

