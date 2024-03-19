Feature: Agent verify Unload card flow

  @uatagentwww
  Scenario: 1 Verify User should login & can unload
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          19 | 900000322 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name       | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation |   848122 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 2 Verify User should login & can unload  with duplicate order check
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |          19 | 900000322 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name       | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation |   848122 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatagentwww
  Scenario: 3 Verify user can not unload if used invalid kit & toast message when User login
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         300 | 10000001034 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name       | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation |   848122 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @uatagentwww
  Scenario: 4 verify phone,email discrepancy modal when User login & used  unmapped kit
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |         300 | 900000237 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                   | name       | fixedOtp |
      |  9555812345 | amit.panwar@yopmail.com | Automation |   848122 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |

  #--------------------------------------------prod feature file is below----------------------------#
  @prodagentwww
  Scenario: 1 Verify User should login & can unload,
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900029425 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name       | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation |   666333 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodagentwww
  Scenario: 2 Verify User should login & can unload with duplicate order check
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900029425 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name       | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation |   666333 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @prodagentwww
  Scenario: 3 Verify user can not unload if used invalid kit & toast message when User login
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber   | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 10000001034 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name       | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation |   666333 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Secure user mapped kit not found or Invalid kit modal message

  @prodagentwww
  Scenario: 4 verify phone,email discrepancy modal when User login & used  unmapped kit
    Given User opens agent BookMyForex url is 'bookmyforex.com/#cardReload'
    And User given all below details for Unload Orders for Agent
      | city  | cardtype                             | currencytype | forexamount | kitnumber | orderType |
      | Delhi | BookMyForex-Yes Bank co-branded card | Euro         |        1501 | 900023709 | unload    |
    Then User able to Book after given all details for agent
    And User Login with Agent Guest details
      | phoneNumber | email                       | name       | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Automation |   666333 |
    And User proceed from home screen with order Details
    And verify duplicate reload/unload orders
    And Verify Modal if unmapped kit number used to reload for user details
      | action  |
      | restart |
