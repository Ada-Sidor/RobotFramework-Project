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
Assertion checking ticket details
    [Arguments]    ${station_from}     ${station_to}    ${expected_ticket_price}
    ${departure_station_element}    Get Text    ${departure_stations_displayed_css}
    log    ${departure_station_element}
    ${arrival_station_text}=    Get Text    ${arrival_station_displayed_css}
    Should Contain    ${arrival_station_text}    ${station_from}
    ${ticket_price_element}    Get Text    ${ticket_price_displayed_css}
    Should Contain    ${ticket_price_element}    ${expected_ticket_price}
    ${departure_date} =    Execute Javascript    return document.querySelector('div.col-md-4').innerText.split('odj: ')[1].split(' ')[0].trim()
    Log    ${departure_date}
    ${day_converted_date}    Set Variable    ${departure_date.split('.')[0]}
    ${month_converted_date}    Set Variable    ${departure_date.split('.')[1]}
    ${year_converted_date}    Set Variable    ${departure_date.split('.')[2]}
    ${converted_date}    set variable    ${year_converted_date}/${month_converted_date}/${day_converted_date}
    Log    ${converted_date}
    Log    ${formatted_date}
    Should Be Equal As Strings    ${converted_date}    ${formatted_date}