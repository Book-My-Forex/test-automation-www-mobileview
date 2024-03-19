Feature: Agent verify user Remit order flow

  @uatagentwww
  Scenario: 1 - User should be able to Transfer Money with purpose Emigration
    Given User opens agent BookMyForex url is 'bookmyforex.com/#moneytransfer'
    And User given all below details for remit Orders for Agent
      | city  | sendingCountry | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |          45 | British Pound | Remittance |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
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
      #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             |
      | net banking | HDFC Bank | 55550118613064 | SBIN0001086 | Tested by Automate |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 2 - User should be able to Transfer Money with purpose Medical Visit
    Given User opens agent BookMyForex url is 'bookmyforex.com/#moneytransfer'
    And User given all below details for remit Orders for Agent
      | city  | sendingCountry | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |          45 | British Pound | Remittance |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
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
      #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             |
      | net banking | HDFC Bank | 55550118613064 | SBIN0001086 | Tested by Automate |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 3 - User should be able to Transfer Money to australia with purpose Transfer Funds to a Non Relative Individual
    Given User opens agent BookMyForex url is 'bookmyforex.com/#moneytransfer'
    And User given all below details for remit Orders for Agent
      | city  | sendingCountry | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom | Wire Transfer |         100 | British Pound | Remittance |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                  | name       | fixedOtp |
      |  7080234123 | test.health100@bmf.com | Automation |   848122 |
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
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:BENE |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   848122 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             |
      | net banking | HDFC Bank | 55550118613064 | SBIN0001086 | Tested by Automate |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  #--------------------------------------------prod feature file is below----------------------------#
  @prodagentwww
  Scenario: 1 - User should be able to Transfer Money with purpose Emigration
    Given User opens agent BookMyForex url is 'bookmyforex.com/#moneytransfer'
    And User given all below details for remit Orders for Agent
      | city  | sendingCountry      | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom (UK) | Wire Transfer |          45 | British Pound | Remittance |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
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
      | net banking | HDFC Bank | 55550118613064 | SBIN0001086 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 2 - User should be able to Transfer Money with purpose Transfer Funds to a Non Relative Individual
    Given User opens agent BookMyForex url is 'bookmyforex.com/#moneytransfer'
    And User given all below details for remit Orders for Agent
      | city  | sendingCountry      | productType   | forexAmount | currency      | orderType  |
      | Delhi | United Kingdom (UK) | Wire Transfer |          45 | British Pound | Remittance |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
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
      | BeneficiaryName | BeneficiaryAddress | SwiftCode | RoutingNumber | BankAccountNumber | nostroValue | BSBCode | ibanNo                 |
      | Biswajeet das   | Georgia            | CITIUS33  |     075000019 |         771123285 | string:BENE |  902800 | DE89370400440532013000 |
    #And Transfer Details OTP verification
      #| fixedOtp |
      #|   333666 |
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | SBIN0001086 | Tested by Automate | d.biswajeetdas3@ibl |
