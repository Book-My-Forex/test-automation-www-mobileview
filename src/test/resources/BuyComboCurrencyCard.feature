Feature: verify combo Order flow= forexCad + Currency Notes

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date 0 means its today                                               #
  ################################################################################
  @uatwww
  Scenario: 1 to verify Combo Order with purposes as (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | FUIPD4056E | Australia   | United States |                0 |               20 |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 2 to verify buy minimum currency (20000.00) order via combo orders
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @uatwww
  Scenario: 3 to verify Combo Order with sim addon
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne   | tcountryTwo | departAfterToday | returnAfterToday |
      | CBYPD7271F | United States |             |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 4 to verify Guest Login,existing card User can not buy card via combo card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User Login with Guest details
      | phoneNumber | email                   | name        | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Guest Login |   848122 |
    Then Existing Card modal should open and redirected to home

  @uatwww
  Scenario: 5 to verify pan validation in case combo order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne   | tcountryTwo | departAfterToday | returnAfterToday |
      | CBYPD7271F | United States |             |               10 |               20 |

  @uatwww
  Scenario: 6 to verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Validate promo 'CASHBACK250' codes
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | FUIPD4056E | Australia   | United States |                0 |               20 |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And Verify Documents upload & Limit for Each

  @uatwww
  Scenario: 7 to verify Combo Order promo code applied
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Validate promo 'CASHBACK250' codes

 @uatwww @d
  Scenario: 8 to verify combo order should be restrict in case education
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | FUIPD4056E | Australia   | United States |                0 |               20 |
 When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
      | One Way Air Ticket  |
      | Valid Student Visa  |
  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 to verify Combo Order with purposes as (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |                0 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 2 to verify buy minimum currency (20000.00) order via combo orders
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @prodwww
  Scenario: 3 to verify Combo Order with sim addon
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 4 to verify Guest Login,existing card User can not buy card via combo card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User Login with Guest details
      | phoneNumber | email                       | name        | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Guest Login |   666333 |
    Then Existing Card modal should open and redirected to home

  @prodwww
  Scenario: 5 to verify pan validation in case combo order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |

  @prodwww
  Scenario: 6 to verify upload documents should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | FUIPD4056E | Australia   | United States of America (USA) |                0 |               20 |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And Verify Documents upload & Limit for Each

  @prodwww @prodsmoketest
  Scenario: 7 to verify Combo Order promo code applied
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Validate promo 'CASHBACK250' codes

  @prodwww 
    Scenario: 8 to verify combo order should be restrict in case education
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         250 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | FUIPD4056E | Australia   | United States |                0 |               20 |
 When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
      | One Way Air Ticket  |
      | Valid Student Visa  |