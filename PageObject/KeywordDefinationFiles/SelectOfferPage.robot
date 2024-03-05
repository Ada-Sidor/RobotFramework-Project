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

Increasing the number of passengers
    Wait Until Element Is Visible    ${number_passengers_id}
    Click Element    ${number_passengers_id}

Choice discount
    [Arguments]     ${discount}
    Scroll Element Into View    ${option_discount_id}
    Wait Until Element Is Visible   ${option_discount_id}    timeout=30s
    Wait Until Element Is Enabled   ${option_discount_id}    timeout=30s
    Click Element    ${option_discount_id}
    sleep    3s
    Wait Until Element Is Visible   ${field_discount_id}  timeout=60s
    Input Text    ${field_discount_id}    ${discount}
    Click Element    ${select_discount_xpath} '${discount}')]

Selecting a ticket option - Best offer
    sleep     10s
    Wait Until Element Is Visible   ${best_offer_xpath}  timeout=60s
    Click Element    ${best_offer_xpath}
    Sleep    3s

Input date owner ticket
    Click Element    ${date_owner_ticket_xpath}
    Sleep    3s
    Input text      ${name_owner_ticket_id}     ${name}
    Input text      ${surname_owner_ticket_id}    ${surname}
    Wait Until Element Is Visible    ${save_date_owner_ticket_button_xpath}   timeout=30s
    Click Element    ${save_date_owner_ticket_button_xpath}
    sleep    5s

Add ticket to cart
    Submit Form    ${add_ticket_to_cart_button_id}

Go to payment
    click element    ${go_to_payment_button_id}

Assertion checking for an error message about missing ticket owner data
    Wait Until Element Is Visible    ${title_error_message_about_missing_ticket_owner_data_xpath}    timeout=30s
    ${modal_title} =    Get Text    ${title_error_message_about_missing_ticket_owner_data_xpath}
    Log    Actual modal title: ${modal_title}
    ${expected_title} =    Set Variable    ${tittle_error}
    Log    Expected modal title: ${expected_title}
    Should Be Equal    ${modal_title}    ${expected_title}
    Wait Until Element Is Visible    ${description_error_message_about_missing_ticket_owner_data_xpath}    timeout=30s
    ${modal_description} =    Get Text    ${description_error_message_about_missing_ticket_owner_data_xpath}
    Should Be Equal    ${modal_description}     ${description_error}
