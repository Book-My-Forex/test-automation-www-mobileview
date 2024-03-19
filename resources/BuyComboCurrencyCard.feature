Feature: verify in case combo order the user not to allow buying currency order from the home screen above or below the threshold forex amount with login
& with purposes as per Required


    Scenario: User should login & can do Combo Order with purposes as Leisure/ Holiday/ Personal Visit
     Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
     When User enters correct credentials 'test.health100@bmf.com', '7080234123' & 'Bmf@1234'
      And User given all below details to buy currency/card
    | city | currency | OrderType | forexAmount|
    | Delhi | Euro | Currency Notes | 30 |
     And User given all below details to buy currency/card
    | city | currency | OrderType | forexAmount|
    | Delhi | Euro |  Forex Card | 30 |
    Then User able to buy after given all details
    And User proceed from home screen with buying detail
    Then edit forex amount to '2500' USD or equivalent to other currency & proceed
    And Verify pan customer details if not then add below details
     | pan | tcountryOne | tcountryTwo |
     | CBYPD7271F | Australia |United States |
     When Select purpose as 'Leisure/ Holiday/ Personal Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    #|International Conference/ Seminar| xyz2 testing | Ltd Company |
    #|Institution Sponsored Training/ Study| xyz3 testing | Sole Proprietor |
    #|Self Sponsored Training/ Study| xyz4 testing | Partnership Firm |
     And Verify Documents upload & Limit for Each
     Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
    |Air Ticket showing travel within 60 days|
    |Valid Visa (If not on arrival)|
    |Aadhar Card(If required)|
   
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
   Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |