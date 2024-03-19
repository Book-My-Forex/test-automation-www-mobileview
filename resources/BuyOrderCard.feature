Feature: verify the user can buy forex card with login & with purposes as per Required

Scenario:1 Existing Card User not to allow buy card with login a modal should displayed
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    And User given all below details to buy currency/card
    | city | currency | OrderType | forexAmount|
    | Delhi | Euro |  Forex Card | 300 |
    Then User able to buy after given all details
    Then Existing Card modal should open and redirected to home
    
 Scenario:2 User should login & card Order with purposes as Leisure/ Holiday/ Personal Visit
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
    When User enters correct credentials 'test.health100@bmf.com', '7080234123' & 'Bmf@1234'
    And User given all below details to buy currency/card
    | city | currency | OrderType | forexAmount|
    | Delhi | Euro |  Forex Card | 300 |
    Then User able to buy after given all details
    And User proceed from home screen with buying detail
    And Verify pan customer details if not then add below details
     | pan | tcountryOne | tcountryTwo |
     | BFAPL9762A | Australia |United States |
     When Select purpose as 'Leisure/ Holiday/ Personal Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    |International Conference/ Seminar| xyz2 testing | Ltd Company |
    |Institution Sponsored Training/ Study| xyz3 testing | Sole Proprietor |
    |Self Sponsored Training/ Study| xyz4 testing | Partnership Firm |
     Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
    |Air Ticket showing travel within 60 days|
    |Valid Visa (If not on arrival)|  
   And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 250.0 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |


Scenario:3 User can Order card with purposes as Business Visit with Tcs values get
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
    And User given all below details to buy currency/card
    | city | currency | OrderType | forexAmount|
    | Delhi | Euro |  Forex Card | 300 |
    Then User able to buy after given all details
    And User proceed from home screen with buying detail
    And Verify pan customer details if not then add below details
     | pan | tcountryOne | tcountryTwo |
     | CBYPD7271F | Australia |United States |
     When Select purpose as 'Business Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    |International Conference/ Seminar| xyz2 testing | Ltd Company |
    |Institution Sponsored Training/ Study| xyz3 testing | Sole Proprietor |
    |Self Sponsored Training/ Study| xyz4 testing | Partnership Firm |
     Then Verify Documents with the Purpose Selected Docs and continue
    |Passport Front Page|
    |Passport Back Page|
    |Air Ticket showing travel within 60 days|
    |Address proof of the company|
    |Cancelled current account cheque|
    |Lerms letter|
    |GST registration certificate|
    |List of signatories authorized by board on letter head|
    |MOA (in case of Pvt. Ltd/ Ltd company)|
    |PAN card of company|
    |Valid Visa (If not on arrival)|
   And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 250.0 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
    Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |