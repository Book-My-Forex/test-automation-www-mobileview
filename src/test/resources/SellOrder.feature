Feature: verify Sell order flow

  @uatwww
  Scenario: 1 to verify minimum sell currency order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          30 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @uatwww @d
  Scenario: 2 User should login & Sell Order via debit card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          10 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 3 To verify CDF modal if user tried to buy => 5000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create

  @uatwww
  Scenario: 4 To verify sell order should be created
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Credit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 5 verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          30 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And Verify Documents upload & Limit for Each

  @uatwww
  Scenario: 6 to verify tat info (Sell)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And user selected or added new address and proceed to Review Screen
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Credit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 to verify minimum sell currency order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          30 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @prodwww
  Scenario: 2 User should login & Sell Order via debit card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          30 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 3 To verify CDF modal if user tried to buy => 5000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create

  @prodwww @prodsmoketest
  Scenario: 4 To verify sell order should be created
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 5 to verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | forexAmount | orderType | productType    |
      | Delhi | Euro     |          30 | sell      | Currency Notes |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And Verify Documents upload & Limit for Each

  @prodwww @prodsmoketest
  Scenario: 6 to verify tat info (sell)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And user selected or added new address and proceed to Review Screen
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
