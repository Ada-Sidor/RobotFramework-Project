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
Selecting checkbox -Direct connections only
    Wait Until Page Contains Element    ${direct_connections_checkbox_id}  timeout=60s
    Select Checkbox    ${direct_connections_checkbox_id}
    Wait Until Element Is Visible    ${search_button_page_selecting_connection_id}
    Click Element    ${search_button_page_selecting_connection_id}

Selecting a connection
    Wait Until Element Is Visible   ${option_connection_css}   timeout=30s
    Click Element    ${option_connection_css}
    Wait Until Element Is Visible    ${next_step_button_xpath}
    Click Element    ${next_step_button_xpath}

Assertion no proposed connections
    ${options}    Get WebElements    ${no_proposed_connections_xpath}
    Should Be Empty    ${options}    not_be_visible_no_proposed_connections

Assertion checking button absence
    ${button_visible} =    Run Keyword And Return Status    Element Should Not Be Visible    ${no_connection_option_css}
    Run Keyword Unless    ${button_visible}    Fail

