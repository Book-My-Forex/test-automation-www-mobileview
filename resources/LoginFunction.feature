Feature: To verify user login on BookMyForex
  To depict user login behaviour on client portal

    Scenario:1 User should login using username and correct password
    Given User opens BookMyForex url is 'https://uat.bookmyforex.com/'
    When User enters correct credentials 'biswajeet.das@bookmyforex.com', '9853048678' & 'Bmf@1234'
    Then User Should Logged In

     #Scenario:2 User should able to do fogot password
    #Given User opens BookMyForex
    #When User opens Login modal and clicked on Forgot to reset with new password
    #for biswajeet.das@bookmyforex.com
    #Then User Should now login with new credentials
    
    