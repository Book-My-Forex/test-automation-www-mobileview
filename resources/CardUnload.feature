Feature: verify user can unload his Card with valid kit number umapped/mapped to his credentials

    Scenario:1 User should login & can unload,new trip with purposes as Leisure/ Holiday/ Personal Visit
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
      Then Switch to Unload section
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|100000010345|
    Then User able to create reload/unload order after given all details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
     Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
     And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
    
    
     Scenario:2 User should login & can not unload with invalid kit verify toast message
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    Then Switch to Unload section
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    | Delhi| BookMyForex-Yes Bank co-branded card | 300 | 10000001034 |
    Then User able to create reload/unload order after given all details
    And Verify Secure user mapped kit not found toast message
    
    Scenario:3 User should login & can not unload with invalid kit verify toast message
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    Then Switch to Unload section
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    | Delhi| BookMyForex-Yes Bank co-branded card | 300 | 100000010344 |
    Then User able to create reload/unload order after given all details
    And Verify Modal if unmapped kit number used to reload for user details
    |action|
    |restart|