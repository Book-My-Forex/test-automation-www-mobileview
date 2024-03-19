Feature: User should login & Create Sell Order below & above threshold Fx amount

    Scenario:1 User should login & Sell Order
     Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
     And Switch to Sell section
     When User enters correct credentials 'test.health100@bmf.com', '7080234123' & 'Bmf@1234'
      And User given all below details to sell currency
    | city | currency | forexAmount |
    | Delhi |  Euro | 30 |
    Then User able to buy after given all details
    And User proceed from home screen with buying detail
    Then edit forex amount to '2500' USD or equivalent to other currency & proceed
    And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
     And user selected or added new address and proceed to Review Screen
      And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
   Scenario:2 To verify CDF modal if user tried to buy equal or more than 5000
     Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
     And Switch to Sell section
    And User given all below details to sell currency
    | city | currency | forexAmount |
    | Delhi | US Dollar | 5000 |
    Then User able to buy after given all details
    And User proceed from home screen with buying detail
    Then CDF modal verify and proceed to order create
     And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    Then Verify Documents with the Purpose Selected Docs and continue
    |Pan Card|
    |Passport Front Page|
    |Passport Back Page|
     And user selected or added new address and proceed to Review Screen
       And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
    Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://uat.bookmyforex.com/order-confirmation-new |
    
  #Scenario:3 To verify guest user CDF modal if user tried to buy equal or more than 5000
     #Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
     #And Switch to Sell section
    #And User given all below details to sell currency
    #| city | currency | forexAmount |
    #| Delhi | US Dollar | 5000 |
   #Then User able to buy after given all details
   #And User Login with Guest details
    #	| PhoneNumber | Email | Name |
      #| 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    #And User proceed from home screen with buying detail
    #Then CDF modal verify and proceed to order create
     #And Customer Detials Name Edited to 'testAutomation Sell' and contnue
    #Then Verify Documents with the Purpose Selected Docs and continue
    #|Pan Card|
    #|Passport Front Page|
    #|Passport Back Page|
     #And user selected or added new address and proceed to Review Screen
      #And to verify Service charge & paid from given bank Details
    #|payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    #|Debit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     #Then user redirected to Order confirmation screen & get Order Reference Number
    #|urlConfirmationPage|
    #| https://uat.bookmyforex.com/order-confirmation-new |