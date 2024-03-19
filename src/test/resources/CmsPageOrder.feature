Feature: verify cms pages create order flow
#
#the cms pges can only tested on prod
  #--------------------------------------------prod feature file is below----------------------------#
    @prodwww
  Scenario: 1 User should login & buy  Order from cms page
    Given User opens BookMyForex url is 'bookmyforex.com/currency-exchange/#buyForex'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency | productType | forexAmount | orderType | page |
      | Delhi | Euro     | Forex Card  |        8375 | Buy       | cms  |
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   |             |               10 |               20 |
    When Select purpose as 'Medical Visit'
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
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww
  Scenario: 2 User should login & sell  Order from cms page
    Given User opens BookMyForex url is 'bookmyforex.com/currency-exchange/#sellForex'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to buy/sell currency/card
      | city  | currency  | forexAmount | orderType | productType    | page |
      | Delhi | US Dollar |        5000 | sell      | Currency Notes | cms  |
    And to verify tat Message for required section
    Then User able to buy after given all details
    And User proceed from home screen with order Details
    Then CDF modal verify and proceed to order create
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card            |
      | Passport Front Page |
      | Passport Back Page  |
    And to verify tat Message for required section
    And user selected or added new address and proceed to Review Screen
    And to verify tat Message for required section
    And to verify Service charge & paid from given bank Details
      | payMode    | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Debit Card | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
