Feature: Agent verify Buy Currency flow

  @uatagentwww
  Scenario: 1 User should login & buy (currency) with purposes as Business Visit via upi above 1 lacs via upi
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   848122 |
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
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww @d
  Scenario: 2  User should login & buy (currency)and purposes as Leisure... Visit via upi below 1 lacs
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |        2500 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   848122 |
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
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  #-------------------------------- prod scenarios are below------------------------------------------------------------
  @prodagentwww
  Scenario: 1 User should login & currency Order with purposes as Leisure, Holiday, Personal Visit
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 2 User can Order currency with purposes as Business Visit with Tcs values get
    Given User opens agent BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy currency/card for Agent
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |        3001 | Buy       |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
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
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
