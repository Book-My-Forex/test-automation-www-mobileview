Feature: verify user can Reload his Card with valid kit number umapped/mapped to his credentials

    Scenario:1 User should login & can Reload,new trip with purposes as Leisure/ Holiday/ Personal Visit
 & mapped kit number
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|100000010345|
    Then User able to create reload/unload order after given all details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      |triptype|
      |New trip|
    When Select purpose as 'Business Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
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
     And select Country travel details
    |tcountryOne|tcountryTwo|
    |Australia |United States |
       And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
    Scenario:2 User should login & can Reload,new trip with but with invalid kit number
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|12311178901|
    Then User able to create reload/unload order after given all details
     And Verify Secure user mapped kit not found toast message
   
    Scenario:3 User should login & can Reload,Current trip with purposes as Leisure/ Holiday/ Personal Visit
 & mapped kit number
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|100000010345|
    Then User able to create reload/unload order after given all details
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      |triptype|
      |Current trip|
    When Select purpose as 'Business Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
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
     And select Country travel details
    |tcountryOne|tcountryTwo|
    |Australia |United States |
       And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
    
    
    Scenario:4 User should login & can Reload with unmapped kit number,Current trip with purposes as Leisure/ Holiday/ Personal Visit
 & if user clicked on modal to proceed with wrong kit no
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|100000010344|
    Then User able to create reload/unload order after given all details
    And Verify Modal if unmapped kit number used to reload for user details
    |action|
    |continue|
    Then Verify under customer details pan not added then add 'CBYPD7271F'
    Then select trip current or new trip and travel details
      |triptype|
      |Current trip|
    When Select purpose as 'Business Visit'
    | reasonForTravel | businessName | businessType |
    |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
    And select Country travel details
    |tcountryOne|tcountryTwo|
    |Australia |United States |
     And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    | Net Banking | 0.0 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
     Scenario:5 User should login & can not Reload,Current trip & unmapped kit number should redirect
     to home if user clicked on modal to re-initiate the order
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#cardReload'
    And User given all below details to buy realod/Unload card
    | city | cardtype | forexamount | kitnumber |
    |Delhi|BookMyForex-Yes Bank co-branded card|300|100000010344|
    Then User able to create reload/unload order after given all details
    And Verify Modal if unmapped kit number used to reload for user details
    |action|
    |restart|
   
