Feature: verify User registration flow and referral flow

  @uatwwwreg
  Scenario: 1 To verify Registration a new user
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials To sign up
      | phone      | email                             | name               | otpFixed | password |
      | 9093830871 | automation_signup_uat@yopmail.com | automated Register |   848122 | Bmf@1234 |
    Then veify registered successfully

  @uatwwwref
  Scenario: 2 To verify after registeraion done refferal should work with promo code applied
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials To sign up
      | phone      | email                             | name               | otpFixed | password |
      | 9093830871 | automation_signup_uat@yopmail.com | automated Register |   848122 | Bmf@1234 |
    Then veify registered successfully
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@12345'
    Then get referral link from my account
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And login with newlycreated user
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType    |
      | Delhi | Euro     | Forex Card  |        5000 | referral Buy |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    #pleas don't change pan from below as it is using for referral orders
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | AWCPC2162M | Australia   |             |               10 |               20 |
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
      | payMode | bankName  | accountNumber  | ifscCode    | remark             | upiId          |
      | net banking     | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | 9853048678@ybl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number
  #--------------------------------------------prod feature file is below----------------------------#
  #@prodwww
 #Scenario: 1 To verify Registration a new user
    #Given User opens BookMyForex url is 'bookmyforex.com/'
    #When User enters correct credentials To sign up
      #| phone      | email                  | name               | otpFixed | password |
      #| 9039830871 | automation@yopmail.com | automated Register |   848122 | Bmf@1234 |
    #Then veify registered successfully
