Feature: verify Unload card flow

  @uatwww
  Scenario: 1 Verify User should login & can unload
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000322 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 2 Verify User should login & can unload  with duplicate order check
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000237 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 3 Verify invalid kit & invalid kit modal message shown
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |          30 | 10000001034 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And Verify Secure user mapped kit not found or Invalid kit modal message
    And verify duplicate reload/unload orders

  @uatwww
  Scenario: 4 verify phone,email discrepancy modal when User login & used  unmapped kit
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber    | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |          30 | 100000010344 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @uatwww
  Scenario: 5 Verify User should login & can unload for entire balance unload
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000237 | unload    | full   |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 6 to verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000322 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And Verify Documents upload & Limit for Each

  @uatwww
  Scenario: 7 to verify tat info partial(unload)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000237 | unload    | partial |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  @uatwww
  Scenario: 8 to verify tat info full unload(unload)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900000237 | unload    | full   |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 Verify User should login & can unload,
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | Thai Baht    |           5 | 900029425 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 2 Verify User should login & can unload with duplicate order check
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | Thai Baht    |           5 | 900029425 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @prodwww
  Scenario: 3 Verify invalid kit & invalid kit modal message shown
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | Thai Baht    |           5 | 10000001034 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @prodwww
  Scenario: 4 verify phone,email discrepancy modal when User login & used  unmapped kit
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | Thai Baht    |           5 | 900023709 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @prodwww
  Scenario: 5 Verify User should login & can unload for entire balance unload
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select |
      | Delhi | BookMyForex-Yes Bank co-branded card | Thai Baht    |          50 | 900029425 | unload    | full   |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @prodwww
  Scenario: 6 to verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900029425 | unload    | partial |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And Verify Documents upload & Limit for Each

  @prodwww
  Scenario: 7 to verify tat info (unload)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select  |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900029425 | unload    | partial |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  @prodwww
  Scenario: 8 to verify tat info full unload(unload)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType | select |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |           5 | 900029425 | unload    | full   |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section
