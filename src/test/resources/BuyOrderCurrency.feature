Feature: verify buy currency flow

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date 0 means its today                                               #
  ################################################################################
  @uatwww @upi
  Scenario: 1 To verify minimum currency order for 20000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @uatwww
  Scenario: 2 To verify create currency order via upi(Business Visit )
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |                0 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww @upi
  Scenario: 3 to verify the sim add on for buy currency via upi(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
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
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 4 to verify tcs will not applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww @card
  Scenario: 5 to verify currency buy created via credit card (Leisure visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | credit card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww @upi
  Scenario: 6 to verify buy currency note Order for oci user via upi (Leisure visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
    #do not change purpose for this scenario
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | No     | Yes |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
      | 3 year ITR Bank Statement                |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 7 to verify upload documents should work (Emigration)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
    When Select purpose as 'Emigration'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card              |
      | Passport Front Page   |
      | Passport Back Page    |
      | Valid Emigration Visa |
      | One Way Air Ticket    |
    And Verify Documents upload & Limit for Each

  @uatwww @uatPromoCodeTest
  Scenario: 8 to verify promo code cases (applied/removing) (BUY CIURRENCY)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Validate promo 'COMEBACK10' codes

  @uatwww @upi
  Scenario: 9 to verify upi limit for >1 lacs (Leisure visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
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
      | payMode | bankName | accountNumber | ifscCode       | remark      | upiId              |                     |
      | upi     |      0.0 | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @uatwww
  Scenario: 10 Verify TCS calculation for order buy currency note(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
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
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States |               10 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And to verify tat Message for required section
    And user selected or added new address and proceed to Review Screen
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  @uatwww
  Scenario: 12 To verify maximum 5 currency type can be added for buy currency order worth 20000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | productType    | forexAmount | orderType |
      | Delhi | US Dollar | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency      | productType    | forexAmount | orderType |
      | Delhi | British Pound | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency        | productType    | forexAmount | orderType |
      | Delhi | Canadian Dollar | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency           | productType    | forexAmount | orderType |
      | Delhi | New Zealand Dollar | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then To verify maximum allowed prouct should be added
      | productType    | currency  | forexAmount |
      | Currency Notes | Thai Baht |         350 |
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 To verify minimum currency order for 20000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @prodwww
  Scenario: 2 to verify tcs will not applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |                0 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 3 to verify buy Currency note Order for oci user (Leisure visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
    #do not change purpose for this scenario
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | No     | Yes |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
      | 3 year ITR Bank Statement                |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 4 to verify sim add on created Order via upi (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 5 to verify buy currency note Order via credit card (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
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
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | credit card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 6 to verify create order currency buy via upi (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 7 to verify upload documents should work (Emigration)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Emigration'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Emigration Visa                    |
      | One Way Air Ticket                       |
    And Verify Documents upload & Limit for Each

  @prodwww
  Scenario: 8 to verify promo code cases (applied/removing) (BUY CIURRENCY)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Validate promo 'COMEBACK10' codes

  @prodwww @upi
  Scenario: 9 to verify upi limit for >1 lacs (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
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
    And to verify Service charge & paid from given bank Details
      | payMode | bankName | accountNumber | ifscCode       | remark      | upiId              |                     |
      | upi     |      0.0 | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 10 Verify TCS calculation for order buy currency(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then edit forex amount to '500' USD or equivalent to 20000 INR in other currency & proceed
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And to verify tat Message for required section
    And user selected or added new address and proceed to Review Screen
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 12 To verify maximum 5 currency type can be added for buy currency order worth 20000
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | productType    | forexAmount | orderType |
      | Delhi | US Dollar | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency      | productType    | forexAmount | orderType |
      | Delhi | British Pound | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency        | productType    | forexAmount | orderType |
      | Delhi | Canadian Dollar | Currency Notes |          30 | Buy       |
    And User given all below details to buy/sell currency/card
      | city  | currency           | productType    | forexAmount | orderType |
      | Delhi | New Zealand Dollar | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then To verify maximum allowed prouct should be added
      | productType    | currency  | forexAmount |
      | Currency Notes | Thai Baht |         350 |
