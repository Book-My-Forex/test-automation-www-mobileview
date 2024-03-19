Feature: verify Mobile order flow

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date 0 means its today                                               #
  ################################################################################
  @uatmwww
  Scenario: 1 to verify on mview existing card User can not buy card
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    Then Existing Card modal should open and redirected to home

  #
  #@uatwww @uatPromoCodeTest
  #Scenario: 2 to verify promo code cases (applied/removing) (BUY CARD)
  #Given User opens BookMyForex url is 'bookmyforex.com/'
  #When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
  #And User given all below details to buy/sell currency/card
  #| city  | currency  | productType | forexAmount | orderType |
  #| Delhi | Thai Baht | Forex Card  |       20010 | Buy       |
  #Then User able to buy after given all details
  #And User proceed from home screen with order Details
  #And Validate promo 'BMFTHBSALE' codes
  #
  @uatmwww
  Scenario: 2 Verify mview TCS calculation for order buy card ignoring sim add on charge(Education)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
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
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatmwww
  Scenario: 3 Verify mview sell currency flow with tat
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
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

  @uatmwww
  Scenario: 4 to verify mview extra charge when purpose(Transfer Funds to a Non Relative Individual)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Transfer Funds to a Non Relative Individual'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Beneficiary Passport             |
      | Remitter Photo Cum Address Proof |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | D Biswajeet Das | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:OURS |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
    #| fixedOtp |
    #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatmwwwd
  Scenario: 5 Verify mview Reload,new trip with mapped kit number(Leisure Visit)-non auto reload
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
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

  @uatmwww
  Scenario: 6 To verify mview create currency order via upi(Business Visit )
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
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


  @uatmwww
  Scenario: 7 to verify mview tat info and partial(unload)flow
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
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

    @uatmwww
  Scenario: 8 Verify mview leftmenu TCS calculation for order buy card ignoring sim add on charge(Education)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    When click on mobile view 'forex buy' from left menu order
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
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
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatmwww
  Scenario: 9 Verify mview leftmenu sell currency flow with tat
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
        When click on mobile view 'forex sell' from left menu order
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

  @uatmwww
  Scenario: 10 to verify mview leftmenu remit order extra charge when purpose(Transfer Funds to a Non Relative Individual)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
        When click on mobile view 'money transfer' from left menu order
    And User enters Money Transfer/Remit Order details
      | city  | country        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Transfer Funds to a Non Relative Individual'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Beneficiary Passport             |
      | Remitter Photo Cum Address Proof |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | D Biswajeet Das | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:OURS |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
    #| fixedOtp |
    #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatmwww
  Scenario: 11 Verify mview leftmenu Reload,new trip with mapped kit number(Leisure Visit)-non auto reload
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    When click on mobile view 'reload forex card' from left menu order
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

  @uatmwww
  Scenario: 12 To verify mview leftmenu create currency order via upi(Business Visit )
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'amit.panwar@yopmail.com', '9555812345' & 'Bmf@1234567'
    When click on mobile view 'forex buy' from left menu order
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


  @uatmwww
  Scenario: 13 to verify mview leftmenu partial(unload)flow
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    When click on mobile view 'unload forex card' from left menu order
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
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number


  #--------------------------------------------prod feature file is below----------------------------#
  @prodmwww
  Scenario: 1 to verify on mview existing card User can not buy card
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    Then Existing Card modal should open and redirected to home

  #
  #@uatwww @uatPromoCodeTest
  #Scenario: 2 to verify promo code cases (applied/removing) (BUY CARD)
  #Given User opens BookMyForex url is 'bookmyforex.com/'
  #When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
  #And User given all below details to buy/sell currency/card
  #| city  | currency  | productType | forexAmount | orderType |
  #| Delhi | Thai Baht | Forex Card  |       20010 | Buy       |
  #Then User able to buy after given all details
  #And User proceed from home screen with order Details
  #And Validate promo 'BMFTHBSALE' codes
  #
  @prodmwww
  Scenario: 3 Verify mview TCS calculation for order buy card ignoring sim add on charge(Education)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType |
      | Delhi | Euro     | Forex Card  |         300 | Buy       |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
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
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay

  @prodmwww
  Scenario: 4 Verify mview TCS calculation for order buy card ignoring sim add on charge(Education)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
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

  @prodmwww
  Scenario: 5 to verify mview extra charge when purpose(Transfer Funds to a Non Relative Individual)
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Transfer Funds to a Non Relative Individual'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Beneficiary Passport             |
      | Remitter Photo Cum Address Proof |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | D Biswajeet Das | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:OURS |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
    #| fixedOtp |
    #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName  | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay

  @prodmwwwd
  Scenario: 6 Verify mview Reload,new trip with mapped kit number(Leisure Visit)-non auto reload
    Given User opens mobile version BookMyForex url is 'bookmyforex.com/'
      | device |
      | mobile |
    When User enters correct credentials for mobile view 'prabhat.jha@bookmyforex.com', '9873516780' & 'Prabhat@135'
    And User given all below details to buy realod/Unload card
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         301 | 900029425 | reload    |
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
      | tcountryOne | tcountryTwo                    | departBeforeAfterToday | returnAfterToday |
      | Australia   | United States of America (USA) |                      1 |               10 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | Yes Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
