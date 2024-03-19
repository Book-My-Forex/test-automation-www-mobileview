Feature: Agent verify Buy card flow

  @uatagentwww
  Scenario: 1 Existing Card User not to allow buy card with login a modal should displayed
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   848122 |
    Then Existing Card modal should open and redirected to home

  @uatagentwww @d
  Scenario: 2 User should login & card Order and purposes as Leisure.. Visit with non indian and Tcs check via net bank
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
    Then User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | No     | Yes |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
      | 3 YEAR ITR BANK STATEMENT                |
    And Verify Documents upload & Limit for Each
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww 
  Scenario: 3 User can Order card with purposes as Business Visit with Tcs should not applied
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 4 to verify FATF modal card User can not buy card Agent
  
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | Netherlands |               10 |               20 |

  #-------------------------------- prod scenarios are below------------------------------------------------------------
  @prodagentwww
  Scenario: 1 Existing Card User not to allow buy card with login a modal should displayed
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name       | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation |   666333 |
    Then Existing Card modal should open and redirected to home

  @prodagentwww
  Scenario: 2 User should login & card Order and purposes as Leisure.. Visit with non indian and Tcs check via net bank
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | No     | Yes |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
      | 3 YEAR ITR BANK STATEMENT                |
    And Verify Documents upload & Limit for Each
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 3 User can Order card with purposes as Business Visit with Tcs should not applied
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |        8500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
