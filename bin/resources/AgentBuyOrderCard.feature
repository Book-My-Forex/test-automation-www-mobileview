#Feature: verify agent www can create card buy
#index
#0=buy
#1=sell
#2=money transfer
#please change as per order type below indexes
#
#Scenario:1 Existing Card User not to allow buy card with login a modal should displayed
    #Given User opens BookMyForex url is 'https://makemytripuat-in.bookmyforex.com/'
     #And User given all below details to buy currency/card for Agent
    #| city | currency | OrderType | forexAmount|index|
    #| Delhi | Euro |  Forex Card | 300 |0|
    #Then User able to buy after given all details for agent
    #| index |
    #| 0 |
    #And User Login with Agent Guest details
    #	| phoneNumber | email | name |
      #| 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    #Then Existing Card modal should open and redirected to home
    #
 #
 #Scenario:2 User should login & card Order with purposes as Leisure/ Holiday/ Personal Visit
    #Given User opens BookMyForex url is 'https://makemytripuat-in.bookmyforex.com/'
     #And User given all below details to buy currency/card for Agent
    #| city | currency | OrderType | forexAmount|index|
    #| Delhi | Euro |  Forex Card | 300 |0|
    #Then User able to buy after given all details for agent
    #| index |
    #| 0 |
    #And User Login with Agent Guest details
    #	| phoneNumber | email | name |
      #| 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    #And User proceed from home screen with buying detail
    #And Verify pan customer details if not then add below details
     #| pan | tcountryOne | tcountryTwo |
     #| BFAPL9762A | Australia |United States |
    #When Select purpose as 'Leisure/ Holiday/ Personal Visit'
    #| reasonForTravel | businessName | businessType |
    #|Company Sponsored Trip| xyz testing | Pvt. Ltd |
    #|International Conference/ Seminar| xyz2 testing | Ltd Company |
    #|Institution Sponsored Training/ Study| xyz3 testing | Sole Proprietor |
    #|Self Sponsored Training/ Study| xyz4 testing | Partnership Firm |
     #Then Verify Documents with the Purpose Selected Docs and continue
    #|Pan Card|
    #|Passport Front Page|
    #|Passport Back Page|
    #|Air Ticket showing travel within 60 days|
    #|Valid Visa (If not on arrival)|  
   #And user selected or added new address and proceed to Review Screen
  #
#
#
#Scenario:3 User can Order card with purposes as Business Visit with Tcs values get
    #Given User opens BookMyForex url is 'https://makemytripuat-in.bookmyforex.com/'
     #And User given all below details to buy currency/card for Agent
    #| city | currency | OrderType | forexAmount|index|
    #| Delhi | Euro |  Forex Card | 300 |0|
    #Then User able to buy after given all details for agent
    #| index |
    #| 0 |
    #And User Login with Agent Guest details
    #	| phoneNumber | email | name |
      #| 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    #And User proceed from home screen with buying detail
    #And Verify pan customer details if not then add below details
     #| pan | tcountryOne | tcountryTwo |
     #| CBYPD7271F | Australia |United States |
     #When Select purpose as 'Business Visit'
    #| reasonForTravel | businessName | businessType |
    #|Company Sponsored Trip| xyz testing | Pvt. Ltd |
    #|International Conference/ Seminar| xyz2 testing | Ltd Company |
    #|Institution Sponsored Training/ Study| xyz3 testing | Sole Proprietor |
    #|Self Sponsored Training/ Study| xyz4 testing | Partnership Firm |
     #Then Verify Documents with the Purpose Selected Docs and continue
    #|Passport Front Page|
    #|Passport Back Page|
    #|Air Ticket showing travel within 60 days|
    #|Address proof of the company|
    #|Cancelled current account cheque|
    #|Lerms letter|
    #|GST registration certificate|
    #|List of signatories authorized by board on letter head|
    #|MOA (in case of Pvt. Ltd/ Ltd company)|
    #|PAN card of company|
    #|Valid Visa (If not on arrival)|
   #And user selected or added new address and proceed to Review Screen
  