Feature: verify Remit order flow

  #############################################################################################################
  #https://jira.bookmyforex.com/browse/BMFDEV-4220  this is to release in 1.2.1 so transfer section to comment#
  #############################################################################################################
  @uatwww @d
  Scenario: 1 to verify remit extra charge when purpose(Transfer Funds to a Non Relative Individual)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
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

  @uatwww
  Scenario: 2 to verify remit order via guest login (Emigration)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User enters Money Transfer/Remit Order details
      | city  | country       | productType   | forexAmount | currency      | orderType  |
      | Delhi | United States | Wire Transfer |         500 | British Pound | Remittance |
    Then User able to create Remit order
    And User Login with Guest details
      | phoneNumber | email                       | name        | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | prabhat jha |   848122 |
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AXZPJ5799D | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Emigration'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Remitter Photo Cum Address Proof |
      | Valid Emigration Visa            |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | biswajeet das   | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:BENE |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank |  107001543484 | ICIC0001312 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 3 to verify Transfer Money to australia with purpose (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country   | productType   | forexAmount | currency      | orderType  |
      | Delhi | Australia | Wire Transfer |        1100 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Patient Passport Front Page      |
      | Patient Passport Back Page       |
      | Remitter Photo Cum Address Proof |
      | Medical Institute Invoice        |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | BSB test        | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:BENE |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 4 to verify documents should be uploaded
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Transfer funds to a family member abroad'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                            |
      | Relationship proof with beneficiary |
      | Remitter Photo Cum Address Proof    |
    And Verify Documents upload & Limit for Each

  @uatwww
  Scenario: 5 to verify promo code cases (applied/removing) (REMIT)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And Validate promo 'COMEBACK10' codes

  @uatwww
  Scenario: 6 to verify tat info (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country   | productType   | forexAmount | currency      | orderType  |
      | Delhi | Australia | Wire Transfer |        1100 | British Pound | Remittance |
    And to verify tat Message for required section
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Patient Passport Front Page      |
      | Patient Passport Back Page       |
      | Remitter Photo Cum Address Proof |
      | Medical Institute Invoice        |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode   | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                   |
      | BSB test        | Georgia            | CHASUS33XXX |     075000019 |         771123285 | string:BENE |  902800 | ES9121000418450200051332 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   848122 |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
    And to verify tat Message for required section

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww @prodsmoketest
  Scenario: 1 to verify remit extra charge when purpose( Transfer Funds to a Non Relative Individual)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country                        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United States of America (USA) | Wire Transfer |         999 | British Pound | Remittance |
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
      | Passport of the beneficiary              |
      | Remitter Photo Cum Address Proof |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:OURS |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   333666 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 2 to verify remit order via guest login (Emigration)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User enters Money Transfer/Remit Order details
      | city  | country             | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom (UK) | Wire Transfer |        1100 | British Pound | Remittance |
    Then User able to create Remit order
    And User Login with Guest details
      | phoneNumber | email                         | name          | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Biswajeet Das |   333666 |
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Emigration'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Remitter Photo Cum Address Proof |
      | Valid Emigration Visa            |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:BENE |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   333666 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 3 to verify Transfer Money to australia with purpose(Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country   | productType   | forexAmount | currency      | orderType  |
      | Delhi | Australia | Wire Transfer |        1100 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Patient Passport Front Page      |
      | Patient Passport Back Page       |
      | Remitter Photo Cum Address Proof |
      | Medical Institute Invoice        |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:BENE |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   333666 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 4 to verify documents should be uploaded
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country                        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United States of America (USA) | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Transfer funds to a family member abroad'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                            |
      | Relationship proof with beneficiary |
      | Remitter Photo Cum Address Proof    |
    And Verify Documents upload & Limit for Each

  @prodwww
  Scenario: 5 to verify promo code cases (applied/removing) (REMIT)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country                        | productType   | forexAmount | currency      | orderType  |
      | Delhi | United States of America (USA) | Wire Transfer |        8500 | British Pound | Remittance |
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And Validate promo 'COMEBACK10' codes

  @prodwww
  Scenario: 6 to verify tat info (Medical Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | city  | country   | productType   | forexAmount | currency      | orderType  |
      | Delhi | Australia | Wire Transfer |        1100 | British Pound | Remittance |
    And to verify tat Message for required section
    Then User able to create Remit order
    And User proceed from home screen with order Details
    And User enter sender details by skipping aadhaar
      | pan        | address      | pinCode | city  | state |
      | AKUPC2694J | Dwarka Delhi |  110023 | Delhi | Delhi |
    When Select purpose as 'Medical Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                         |
      | Patient Passport Front Page      |
      | Patient Passport Back Page       |
      | Remitter Photo Cum Address Proof |
      | Medical Institute Invoice        |
    And Enter Beneficiary Details
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:BENE |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   333666 |
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
