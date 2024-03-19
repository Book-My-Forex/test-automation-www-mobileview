Feature: To verify if user able to do guest Login

  Scenario:5 - User should be able to create order by guest login

    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/#moneytransfer'
    And User enters Money Transfer/Remit Order details
      | City | Country | Product | forexAmount |
      | Delhi | United States | Wire Transfer | 1100 |
    Then User able to create Remit order
    And User Login with Guest details
    	| PhoneNumber | Email | Name |
      | 7233068865 | shaan@yopmail.com | Shaan Choudhary |
    
