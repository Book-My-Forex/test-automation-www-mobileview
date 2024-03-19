Feature: To verify if user able to create Remit order for USA


Scenario:5 - User should be able to Transfer Money for Emigration

    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#moneytransfer'
    When User enters correct credentials 'prabhat.jha@bookmyforex.com', '9873516780' & 'Bmf@123456'
    And User enters Money Transfer/Remit Order details
      | City | Country | Product | forexAmount |
      | Delhi | United States | Wire Transfer | 1100 |
    Then User able to create Remit order
    #And User Login with Guest details
    #	| PhoneNumber | Email | Name |
      #| 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    And User enter sender details by skipping aadhaar
      | Pan | Address | PinCode | City | State |
      | AKUPC2694J | Dwarka Delhi | 110023 | Delhi | Delhi |
    When Select purpose as 'Emigration'
      | reasonForTravel | businessName | businessType |
      |Company Sponsored Trip| xyz testing | Pvt. Ltd |
    Then Verify Documents with the Purpose Selected Docs and continue
      |Pan Card|
      |Remitter Photo Cum Address Proof|
      |Valid Emigration Visa|
    And Enter Beneficiary Details
      |BeneficiaryName|BeneficiaryAddress|SwiftCode|RoutingNumber|BankAccountNumber|nostroValue|BSBCode|ibanNo|
      |Sandeep Singh  |Georgia           |CHASUS33XXX|075000019  |771123285      |string:BENE|902800   |ES9121000418450200051332|
    And Fetch OTP from external website
     And to verify Service charge & paid from given bank Details
    |payMode|serviceCharge| bankName |accountNumber| ifscCode |remark|
    |Credit Card| 0.00 | State Bank of India | 34440179073 | SBIN0001086 |Tested by Automate for Net banking|
     Then user redirected to Order confirmation screen & get Order Reference Number
    |urlConfirmationPage|
    | https://kube-uat.bookmyforex.com/order-confirmation-new |





    









