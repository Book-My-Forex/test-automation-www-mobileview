Feature: verify Guest Login and Normal Login

  @uatwww
  Scenario: 1 to verify Guest login
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User Login with Guest details
      | phoneNumber | email                         | name        | fixedOtp |
      |  9853048678 | biswajeet.das@bookmyforex.com | Guest Login |   848122 |
    And User proceed from home screen with order Details

  @uatwww
  Scenario: 2 to verify Normal login
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'


  @uatwww
  Scenario: 3 to verify Normal login invalid credentials password worng
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@12305'

  #--------------------------------------------prod feature file is below----------------------------#
  @prodwww
  Scenario: 1 to verify Guest login
    Given User opens BookMyForex url is 'bookmyforex.com/'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType    | forexAmount | orderType |
      | Delhi | Euro     | Currency Notes |          30 | Buy       |
    Then User able to buy after given all details
    And User Login with Guest details
      | phoneNumber | email                         | name        | fixedOtp |
      |  9873516780 | prabhat.jha@bookmyforex.com | Guest Login |   666333 |
    And User proceed from home screen with order Details

  @prodwww
  Scenario: 2 to verify Normal login
    Given User opens BookMyForex url is 'bookmyforex.com/'
   When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'


  @prodwww
  Scenario: 3 to verify Normal login invalid credentials password worng
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@12305'
