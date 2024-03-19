Feature: verify Sim order flow

  @uatwww
  Scenario: 1 User should login & buy sim Order via net banking

    Given User opens BookMyForex url is 'bookmyforex.com/#simplan'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to order sim
      | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday | orderType |
      | Australia   | United States |               10 |               20 | Buy       |
    Then User able to buy sim after given all details
     And User proceed from home screen with order Details
    And User select the plan
    Then Activation, address Submit and Sim book
    And user selected or added new address and proceed to Review Screen
    Then Sim order payment
      | payMode     | bankName      |
      | Net Banking | HDFC Bank |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 User should login & buy sim Order via net banking
    Given User opens BookMyForex url is 'bookmyforex.com/#simplan'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to order sim
      | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday | orderType |
      | Australia   | United States |               10 |               20 | Buy       |
    Then User able to buy sim after given all details
     And User proceed from home screen with order Details
    And User select the plan
    Then Activation, address Submit and Sim book
    And user selected or added new address and proceed to Review Screen
    Then Sim order payment
      | payMode     | bankName      |
      | Net Banking | HDFC Bank |

