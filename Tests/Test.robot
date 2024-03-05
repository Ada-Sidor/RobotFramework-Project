*** Settings ***
Library  SeleniumLibrary
Library    DateTime
Library    String
Test Setup  OPEN WEB APP
Test Teardown    Close All Browsers
Resource  ../PageObject/KeywordDefinationFiles/HomePage.robot
Resource  ../PageObject/KeywordDefinationFiles/SelectConnectionPage.robot
Resource  ../PageObject/KeywordDefinationFiles/SelectOfferPage.robot
Resource  ../PageObject/KeywordDefinationFiles/OrderSummaryPage.robot

*** Variables ***
${driver_path}    C:\\Program Files\\chromedriver-win64\\chromedriver.exe
${formatted_date}    ${EMPTY}
${converted_date}   ${EMPTY}

*** Test Cases ***
Test-01 -Test Finding Connection, Selecting Ticket, and Adding to Cart
    [Documentation]     This test verifies the process of finding a connection, selecting a ticket, and adding it to the cart.
    Search For Departure Station    ${station_from}
    Search For Arrival Station    ${station_to}
    Search For Date And Hour    ${add_days}
    Search For Connections
    Selecting a connection
    Selecting a ticket option - Best offer
    Input date owner ticket
    Add ticket to cart
    Sleep    15s
    Assertion checking ticket details    ${station_from}    ${station_to}    ${expected_ticket_price}
    Go to payment

Test-02 -Test Incorrect Connection Searches with Empty Fields
    [Documentation]     This test checks for errors when attempting to search for connections with empty fields.
    Search For Connections
    Assertion checking arrival station field error

Test-03 -Test Only Departure Station Entered
    [Documentation]     This test checks the behavior when only the departure station is entered.
    Search For Departure Station    ${station_from_invalid}
    Search For Connections
    Assertion no proposed connections

Test-04 - Test Only Arrival Station Entered
    [Documentation]     This test checks the behavior when only the arrival station is entered.
    Search For Arrival Station    ${station_to_invalid}
    Search For Connections
    Assertion no proposed connections

Test-05 -Test Direct Connection
    [Documentation]     This test checks the behavior when only the arrival station is entered.
    ${expected_ticket_price}=  Set Variable    4,20 zł
    sleep    5s
    Search For Departure Station    ${station_from}
    Search For Arrival Station    ${station_to}
    Search For Date And Hour    ${add_days}
    Search For Connections
    Selecting checkbox -Direct connections only
    Sleep   15s
    Selecting a connection
    Sleep   10s
    Selecting a ticket option - Best offer
    Input date owner ticket
    Add ticket to cart
    sleep    15s
    Assertion checking ticket details    ${station_from}    ${station_to}    ${expected_ticket_price}
    Go to payment

Test-06 -Test Invalid Searching for Same Stations Arrival and Departure
    [Documentation]     This test verifies the functionality of selecting a direct connection.
    Search For Departure Station    ${station}
    Search For Arrival Station    ${station}
    Search For Connections
    Assertion checking arrival station field error

Test-07 -Test Functionality of Increasing the Number of Passengers in a Transaction
    [Documentation]     This test verifies the functionality of increasing the number of passengers during a transaction.
    ${expected_ticket_price}=      Set Variable    8,40 zł
    Search For Departure Station    ${station_from}
    Search For Arrival Station    ${station_to}
    Search For Date And Hour    ${add_days}
    Search For Connections
    Sleep   10s
    Selecting a connection
    sleep    5s
    Increasing the number of passengers
    sleep    5s
    Selecting a ticket option - Best offer
    Input date owner ticket
    Add ticket to cart
    sleep   15s
    Assertion checking ticket details       ${station_from}     ${station_to}       ${expected_ticket_price}
    Go to payment

Test-08 -Test Choose Discounted Ticket
    [Documentation]     This test verifies the functionality of choosing a discounted ticket option.
    ${discount}         Set Variable    Studenci
    ${expected_ticket_price}=      Set Variable    2,06 zł
    Search For Departure Station    ${station_from}
    Search For Arrival Station    ${station_to}
    Search For Date And Hour    ${add_days}
    Search For Connections
    Selecting a connection
    sleep    5s
    Choice discount     ${discount}
    sleep    5s
    Selecting a ticket option - Best offer
    Input date owner ticket
    Add ticket to cart
    sleep    15s
    Assertion checking ticket details       ${station_from}     ${station_to}       ${expected_ticket_price}
    Go to payment

Test-09 -Test Invalid Transaction: No Ticket Owner Data Completed
    [Documentation]    This test checks for errors when attempting a transaction without completing ticket owner data.
    Search For Departure Station    ${station_from}
    Search For Arrival Station    ${station_to}
    Search For Date And Hour    ${add_days}
    Search For Connections
    Selecting a connection
    Selecting a ticket option - Best offer
    Add ticket to cart
    sleep    5s
    Assertion checking for an error message about missing ticket owner data