Feature: verify Reload card flow

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date 0 means its today                                               #
  ################################################################################
  @uatwww
  Scenario: 1 to Verify Reload,new trip with mapped kit number(Leisure Visit)-non auto reload
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                      1 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | Yes Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 2 to verify duplicate reload/unload orders
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders

  @uatwww @autoreload
  Scenario: 3 To Verify TCS calculation for Reload order auto reload (Leisure)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'BODPM4264E'
    Then select trip current or new trip and travel details
      | triptype     |
      | current trip |
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
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     20 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | Yes Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww @card
  Scenario: 4 to verify reload order with mapped kit number,TCS (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | new trip |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     10 |               20 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | Yes Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 5 Verify invalid kit toast message
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.rout@bmf.com', '9090456123' & 'Root@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 12311178901 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @uatwww @upi
  Scenario: 6 to verify user can reload order with unmapped kit reload order(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |           9 | 900000237 | reload    |
    Then User able to create reload/unload order after given all details
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
      | payMode | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | Upi     | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 7 to verify unmapped kit and discrepancy modal to display
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.rout@bmf.com', '9090456123' & 'Root@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 900000237 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @uatwww @card
  Scenario: 8  To Verify TCS calculation for order reload card (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.rout@bmf.com', '9090456123' & 'Root@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype              | currencytype | forexamount | cardNumber       | orderType |
      | Delhi | ICICI Bank forex card | Euro         |        1501 | 1234567890123456 | reload    |
    Then User able to create reload/unload order after given all details
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
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

#below test case is commented becosue there is a issue in delteing docs
  @uatwww @d
  Scenario: 9 to verify upload documents should work(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                      1 |               10 |
    And Verify Documents upload & Limit for Each

  @uatwww
  Scenario: 10 to verify TCS Should not be applied with mapped kit & Sim add on(Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        8000 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
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
      | Australia   | United States |                      1 |               10 |
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        8000 | 900000322 | reload    |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
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
      | Australia   | United States |                      1 |               10 |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  @uatwww
  Scenario: 12 Verify Reload,new trip user can not select date after 60 days
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     61 |               70 |

  @uatwww 
  Scenario: 13 Verify to not restrict if user selected Education TCS calculation(Education)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          14 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
      Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                              |
      | Passport Front Page                   |
      | Passport Back Page                    |
      | I-20/Admission Letter From University |
      | One Way Air Ticket                    |
      | Valid Student Visa                    |
    And select Country travel details
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     61 |               70 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 to Verify Reload,new trip with mapped kit number,TCS(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |        1501 | 900029425 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | Australia   | United States of America (USA) |                      1 |               10 |
    And Verify Documents upload & Limit for Each
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 2 to verify duplicate reload/unload orders
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          14 | 900029425 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders

  @prodwww @card @prodsmoketest
  Scenario: 3 To Verify TCS calculation for Reload order auto reload (Education)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          14 | 900029425 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype     |
      | Current trip |
    When Select purpose as 'Education'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
      Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                              |
      | Passport Front Page                   |
      | Passport Back Page                    |
      | I-20/Admission Letter From University |
      | One Way Air Ticket                    |
      | Valid Student Visa                    |
    And select Country travel details
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                     20 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 4 Verify invalid kit toast message
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 12311178901 | reload    |
    Then User able to create reload/unload order after given all details
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @prodwww
  Scenario: 5 To Verify User should login & Reload with unmapped kit number (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |           9 | 900023700 | reload    |
    Then User able to create reload/unload order after given all details
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
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |  |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |  |

  #@prodwww
  #Scenario: 6 to verify user can reload order reload order (Medical Visit)
  #Given User opens BookMyForex url is 'bookmyforex.com/'
  #When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
  #And User given all below details to buy realod/Unload card
  #| city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
  #| Delhi | BookMyForex-Yes Bank co-branded card | Euro         |           9 | 900029425 | reload    |
  #Then User able to create reload/unload order after given all details
  #And verify duplicate reload/unload orders
  #And User proceed from home screen with order Details
  #And Verify Modal if unmapped kit number used to reload for user details
  #| action   |
  #| continue |
  #Then Verify under customer details pan not added then add 'CBYPD7271F'
  #Then select trip current or new trip and travel details
  #| triptype     |
  #| current Trip |
  #When Select purpose as 'Medical Visit'
  #| reasonForTravel        | businessName | businessType | indian | oci |
  #| Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
  #Then Verify Documents with the Purpose Selected Docs and continue
  #| Pan Card                                 |
  #| Passport Front Page                      |
  #| Passport Back Page                       |
  #| Air Ticket showing travel within 60 days |
  #| Valid Visa (If not on arrival)           |
  #And select Country travel details
  #| tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
  #| Australia   | United States of America (USA) |                     10 |               20 |
  #And to verify Service charge & paid from given bank Details
  #| payMode     |  bankName      | accountNumber  | ifscCode    | remark             | upiId               |
  #| net banking |           HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
  @prodwww
  Scenario: 7 to verify unmapped kit and discrepancy modal to display
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          17 | 900023709 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  @prodwww @prodsmoketest
  Scenario: 8 to verify icici card reload flow (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy realod/Unload card
      | city  | cardtype              | currencytype | forexamount | cardNumber       | orderType |
      | Delhi | ICICI Bank forex card | Euro         |         501 | 1234567890123456 | reload    |
    Then User able to create reload/unload order after given all details
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
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest
  Scenario: 9 to verify upload documents should work (Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | US Dollar    |        1501 | 900029425 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | Australia   | United States of America (USA) |                      1 |               10 |
    And Verify Documents upload & Limit for Each

  @prodwww
  Scenario: 10 to verify TCS Should not be applied with mapped kit(Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        8000 | 900029425 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
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
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                      1 |               10 |
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 11 to verify tat info (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        8000 | 900029425 | reload    |
    And to verify tat Message for required section
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
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
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                      1 |               10 |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 12 Verify Reload,new trip user can not select date after 60 days
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900000322 | reload    |
    Then User able to create reload/unload order after given all details
    And verify duplicate reload/unload orders
    And User proceed from home screen with order Details
    Then Verify under customer details pan not added then add 'AQTPD0263B'
    Then select trip current or new trip and travel details
      | triptype |
      | New trip |
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
      | tcountryOne | tcountryTwo   | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States |                     61 |               70 |
