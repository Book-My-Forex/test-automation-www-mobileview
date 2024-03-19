Feature: Agent verify Reload  card flow

  @uatagentwww
  Scenario: 1 to verify TCS Should not be applied with mapped kit(Business Visit)
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000322 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                               |
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
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 2 verify user should login & can Reload,Current trip with purposes as Medical Visit
    & mapped kit number

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000322 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 3 Verify user can not Reload,new trip with invalid kit number on login
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 12311178901 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @uatagentwww
  Scenario: 4 verify phone,email discrepancy modal when User login & used  unmapped kit & if user clicked on modal to proceed
    with wrong details via Upi

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000237 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action   |
      | continue |
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 5 verify user should login & can Reload,Current trip & purposes as Medical Visit via UPI
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000322 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 6 Verify User should redirect to home if login & Reload,Current trip with unmapped kit number,then user clicked on modal
    to re-initiate the order

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000237 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @uatagentwww
  Scenario: 7  verify user should login & can Other card (except BMF card)Reload,new trip with Sim
     purposes as Medical Visit via Net banking with reload form should be present

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype              | currencytype | forexamount | cardNumber       | orderType |
      | Delhi | ICICI Bank forex card | Euro         |        1501 | 1234567890123456 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | new trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Reload Form                              |
      | Valid Visa (If not on arrival)           |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 8 To Verify TCS calculation for Reload order with unmapped kit (Education)
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900000322 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name            | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation Test |   848122 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'BODPM4264E'
    Then select trip current or new trip and travel details
      | triptype     |
      | current trip |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
      Then Verify Documents with the Purpose Selected Docs and continue
     | Pan Card                              |
      | Passport Front Page                   |
      | Passport Back Page                    |
      | I-20 (In case of USA colleges)        |
      | I-20/Admission Letter From University |
      | One Way Air Ticket                    |
      | Valid Student Visa                    |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     20 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | Yes Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  #--------------------------------------------prod feature file is below----------------------------#
  @prodagentwww
  Scenario: 1 Verify User should login & can Reload,new trip with purposes as Business Visit
    with mapped kit number

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900029425 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | PAN CARD                                               |
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
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 2 verify user should login & can Reload,Current trip with purposes as Leisure, Holiday,Personal Visit
    & mapped kit number

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          14 | 900029425 | reload    |
    And User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     10 |               20 |
    And Verify Documents upload & Limit for Each
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 3 Verify user can not Reload,new trip with invalid kit number on login
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 12311178901 | reload    |
    And User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And User proceed from home screen with order Details
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @prodagentwww
  Scenario: 4 Verify User should login & Reload with unmapped kit number,Current trip with purposes as Leisure, Holiday, Personal Visit
    & if user clicked on modal to proceed with wrong details

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |           9 | 900023700 | reload    |
    And User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action   |
      | continue |
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current Trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 5 verify user should login & can Reload,new trip and purposes as Medical Visit via UPI
    & mapped kit number

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |           9 | 900023709 | reload    |
    And User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action   |
      | continue |
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | new trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 6 Verify User should redirect to home if login & Reload,Current trip with unmapped kit number,then user clicked
    on modal to re-initiate the order

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 900023700 | reload    |
    And User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @prodagentwww
  Scenario: 7  verify user should login & can Other card (except BMF card)Reload,new trip with Sim
    purposes as Medical Visit via Net banking with reload form should be present

    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype              | currencytype | forexamount | cardNumber       | orderType |
      | Delhi | ICICI Bank forex card | Euro         |        1501 | 1234567890123456 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | new trip |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Reload Form                              |
      | Valid Visa (If not on arrival)           |
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww @d
  Scenario: 8 To Verify TCS calculation for Reload order unmapped kit (Education)
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Reload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900029425 | reload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name            | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation Test |   666333 |
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'BODPM4264E'
    Then select trip current or new trip and travel details
      | triptype     |
      | current trip |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
   | Pan Card                              |
      | Passport Front Page                   |
      | Passport Back Page                    |
      | I-20 (In case of USA colleges)        |
      | I-20/Admission Letter From University |
      | One Way Air Ticket                    |
      | Valid Student Visa                    |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     20 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | Yes Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
