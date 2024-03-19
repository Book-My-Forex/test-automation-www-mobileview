Feature: Agent verify Sell order flow

  @uatagentwww
  Scenario: 1 User should login & Sell Order via Net banking
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency | forexamount | product        | orderType |
      | Delhi | Euro     |          30 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email             | name       | fixedOtp |
      |  9090456123 | test.rout@bmf.com | Automation |   848122 |
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 2 To verify CDF modal if user tried to buy equal or more than 5000 via Credit card
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency  | forexamount | product        | orderType |
      | Delhi | US Dollar |        5000 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email             | name       | fixedOtp |
      |  9090456123 | test.rout@bmf.com | Automation |   848122 |
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Credit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 3 To verify CDF modal if user tried to buy equal or more than 5000 via net bank
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency  | forexamount | product        | orderType |
      | Delhi | US Dollar |        5000 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email             | name       | fixedOtp |
      |  9090456123 | test.rout@bmf.com | Automation |   848122 |
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  #--------------------------------------------prod feature file is below----------------------------#
  @prodagentwww
  Scenario: 1 User should login & Sell Order via Net banking
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency  | forexamount | product        | orderType |
      | Delhi | US Dollar |          30 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 2 To verify CDF modal if user tried to buy equal or more than 5000 via credit card
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency  | forexamount | product        | orderType |
      | Delhi | US Dollar |        5000 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | credit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 3 To verify CDF modal if user tried to buy equal or more than 5000 via net bank
    Given User opens agent BookMyForex url is 'bookmyforex.com/#sellForex'
    And User given all below details to sell currency for Agent
      | city  | currency  | forexamount | product        | orderType |
      | Delhi | US Dollar |        5000 | Currency Notes | sell      |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                         | name       | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Automation |   333666 |
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | net banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
