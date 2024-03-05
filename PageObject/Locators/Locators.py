
# Strona główna - Wyszukiwanie połączenia
window_cookie = "//button[text()='Zamknij']"
departure_station_id = "id:station-from"
departure_station_ul = "//ul[@id='ui-id-1']//div[text()="
arrival_station_id = "id:station-to"
arrival_station_ul = "//ul[@id='ui-id-2']//div[text()="
date_id = "id:date"
hour_id = "id:hour"
search_button_xpath = "//button[@class='align-self-center btn btn-default btn-primary' and contains(text(), 'Szukaj')]"
field_error_css = "css: .is-invalid"

# Strona Wybór połączenia
direct_connections_checkbox_id = "id:direct"
search_button_page_selecting_connection_id = "id:query_search"
option_connection_css = "css:div[data-slick-index='0'] .btn-secondary.connection-select"
next_step_button_xpath = "//form[@id='goto-step2']//button[contains(@class, 'btn-primary')]"
no_proposed_connections_xpath = "//div[@class='slick-track']//div[contains(@class, 'connection-slide')]"
no_connection_option_css = "css:#accordion-rjp .connection-select"

# Strona Wybór oferty
number_passengers_id = "id:discount-plus"
option_discount_id = "id:discount-select"
field_discount_id = "id:discount-search"
select_discount_xpath = "//div[@id='lista-znizek']//span[contains(text(),"

best_offer_xpath = "//div[@id='offer-slide-0']//a[@class='btn btn-primary offer-select']"

date_owner_ticket_xpath = "//a[contains(text(), 'Podaj dane okaziciela biletu')]"
name_owner_ticket_id = "id:imie"
surname_owner_ticket_id = "id:nazwisko"
save_date_owner_ticket_button_xpath = "//div[@id='ownerModal']//div[@class='modal-footer']/button"

add_ticket_to_cart_button_id = "id=goto-basket"
go_to_payment_button_id = "id:goto-payment"

title_error_message_about_missing_ticket_owner_data_xpath = "//div[@id='ownerErrorModal']//h4[@class='modal-title']"
description_error_message_about_missing_ticket_owner_data_xpath = "//div[@id='ownerErrorModal']//div[@class='modal-description']"

# Strona podsumowania zamówienia
departure_stations_displayed_css = "css:.row > div:nth-child(1) .col-md-4"
arrival_station_displayed_css = "css:.row > div:nth-child(1) .col-md-4"
ticket_price_displayed_css = "css:.row > div:nth-child(1) .col-md-8 .sum-price"

date_displayed = 'div.col-md-4'
