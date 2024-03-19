Feature: verify buy card flow

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date 0 means its today                                               #
  ################################################################################
  @uatwww
  Scenario: 1 to verify existing card User can not buy card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    Then Existing Card modal should open and redirected to home

  @uatwww @uatPromoCodeTest
  Scenario: 2 to verify promo code cases (applied/removing) (BUY CARD)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | productType | forexAmount | orderType |
      | Delhi | Thai Baht | Forex Card  |       20010 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Validate promo 'BMFTHBSALE' codes

  @uatwww
  Scenario: 3 Verify TCS calculation for order buy card ignoring sim add on charge(Education)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
      | One Way Air Ticket  |
      | Valid Student Visa  |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 4 to verify created card Order for oci user (Leisure visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         700 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 5 to verify tcs will not applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww @upi
  Scenario: 6 verify UPi bank wise limit instead of 1lacs (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | CBYPD7271F | Australia   |             |               10 |               20 |
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
      | payMode | bankName  | accountNumber  | ifscCode    | remark             | upiId          |
      | upi     | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | 9853048678@ybl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 7 to verify pan validation should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |

  @uatwww
  Scenario: 8 verify sim add on for buy card (Emigration)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
    When Select purpose as 'Emigration'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card              |
      | Passport Front Page   |
      | Passport Back Page    |
      | Valid Emigration Visa |
      | One Way Air Ticket    |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add

  @uatwww
  Scenario: 9 to verify upload documents should work (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
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
  Scenario: 10 Verify TCS is mandatory in Neft for order buy card (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
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
      | payMode    | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | NEFT/ RTGS | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  @uatwww
  Scenario: 12 Verify TCS calculation for buy card when tAmount is < 7 lacs but gTotal =7lacs(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 13 to verify FATF modal card User can not buy card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | Netherlands |               10 |               20 |

  @uatwww
  Scenario: 14 Verify travel date can not be selected beyond 60 days
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               61 |               20 |

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww @prodsmoketest
  Scenario: 1 to verify existing card User can not buy card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    Then Existing Card modal should open and redirected to home

  @prodwww @prodsmoketest @prodPromoCodeTest
  Scenario: 2 to verify promo code cases (applied/removing)(BUY CARD)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | productType | forexAmount | orderType |
      | Delhi | Thai Baht | Forex Card  |       20010 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Validate promo 'BMFTHBSALE' codes

  @prodwww @prodsmoketest
  Scenario: 3 Verify TCS calculation for order buy card ignoring sim add on(Education)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
      | One Way Air Ticket  |
      | Valid Student Visa  |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 4 User order should be created card Order for oci user (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         750 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 5 to verify tcs will not applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
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
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |

  @prodwww @prodsmoketest
  Scenario: 6 verify UPi bank wise limit instead of 1lacs (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode | bankName  | accountNumber  | ifscCode    | remark             | upiId          |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | 9853048678@ybl |

  @prodwww @prodsmoketest
  Scenario: 7 to verify pan validation should work
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |

  @prodwww @prodsmoketest
  Scenario: 8  verify sim add on for buy card (Medical visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 9 to verify upload documents should work (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And Verify Documents upload & Limit for Each

  @prodwww @prodsmoketest @d
  Scenario: 10 Verify TCS is mandatory in Neft for order buy card (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode               | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | offline bank transfer | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |


  @prodwww @prodsmoketest
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |

  @prodwww @prodsmoketest
  Scenario: 12 Verify TCS calculation for buy card when tamount is < 7 lacs but gTotal =7lacs(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 13 to verify FATF modal card User can not buy card
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | Vietnam     |               10 |               20 |

  @prodwww
  Scenario: 14 Verify travel date can not be selected beyond 60 days
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               61 |               20 |
