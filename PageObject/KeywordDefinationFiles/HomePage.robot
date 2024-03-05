*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Variables ***
${driver_path}    C:\\Program Files\\chromedriver-win64\\chromedriver.exe
${formatted_date}    ${EMPTY}
${converted_date}   ${EMPTY}

*** Keywords ***
OPEN WEB APP
    Open Browser    ${browser}    browser=chrome    executable_path=${driver_path}
    sleep    3s
    Wait Until Element Is Visible   ${window_cookie}    timeout=60s
    Click Element    ${window_cookie}
    Sleep     1s

Search For Departure Station
    [Arguments]    ${station_from}
    Click Element    ${departure_station_id}
    Input Text    ${departure_station_id}    ${station_from}
    Wait until element is visible    ${departure_station_ul}'${station_from}']       timeout=60s
    click element    ${departure_station_ul}'${station_from}']

Search For Arrival Station
    [Arguments]    ${station_to}
    Click Element    ${arrival_station_id}
    Input Text    ${arrival_station_id}    ${station_to}
    wait until element is visible    ${arrival_station_ul}'${station_to}']     timeout=60s
    click element    ${arrival_station_ul}'${station_to}']

Search For Date And Hour
    [Arguments]    ${add_days}
    ${current_date}=    Get Current Date
    ${new_date}=    Add Time To Date    ${current_date}    ${add_days}
    ${formatted_date}=    Convert Date    ${new_date}    result_format=%Y/%m/%d
    Set Global Variable    ${formatted_date}
    Click Element    ${date_id}
    Input Text    ${date_id}    ${formatted_date}
    Click Element    ${hour_id}
    Input Text    ${hour_id}    ${hour}

Search For Connections
    Click Element    ${search_button_xpath}
    Sleep    2s

Assertion checking arrival station field error
    ${count} =    Get Element Count    ${field_error_css}
    Run Keyword If    ${count} > 0    Log    ${color_error_css}    ELSE    Fail    Element doesn't have red border
    ${current_url} =    Get Location
    Should Be Equal As Strings    ${current_url}    ${browser}