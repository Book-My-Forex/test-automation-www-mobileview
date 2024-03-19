Feature: verify better rate request order flow

  ################################################################################
  #-for sim add on the travel date should more than 1 week and less than 30 days #
  #- tarvel date departAfterToday=0 means its today                              #
  ################################################################################
  @uatwww
  Scenario: 1 To Verify user create order buy card from better rate request
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |         500 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details

  @uatwww
  Scenario: 2 To Verify user pan for better rate order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |         500 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |

  @uatwww
  Scenario: 3 To verify Tcs should not be applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
    When Select purpose as 'Business Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Passport Front Page                                    |
      | Passport Back Page                                     |
      | Air Ticket showing travel within 60 days               |
      | Address proof of the company                           |
      | Cancelled current account cheque                       |
      | Lerms letter                                           |
      | GST registration certificate                           |
      | List of signatories authorized by board on letter head |
      | MOA (in case of Pvt. Ltd/ Ltd company)                 |
      | PAN card of company                                    |
      | Valid Visa (If not on arrival)                         |
    And user selected or added new address and proceed to Review Screen
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 55550118613064 | FDRL0005555 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 4 To Verify promo code applied or not,and sim add on,tcs-BetterRateRequest(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |         700 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |
    Then payment done via Razorpay
    Then user redirected to Order confirmation screen & get Order Reference Number

  @uatwww
  Scenario: 5 To Verify minimum amount for buy currency from better rate request
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product        | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |         500 | Currency Notes | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @uatwww
  Scenario: 6 To Verify TCS calculation for order buy card-BetterRateRequest(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.uat@bookmyforex.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo   | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
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

  #----------------------------------- prod -----------------
  @prodwww @prodsmoketest
  Scenario: 1 To Verify user create order with cashback from better rate request
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |         300 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details

  @prodwww
  Scenario: 2 To Verify user pan for better rate order
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |

  @prodwww @prodsmoketest @d
  Scenario: 3 To verify tcs will not applied (Business Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
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

  @prodwww @d
  Scenario: 4 To Verify promo code applied or not,and sim add on,tcs-BetterRateRequest(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
      | reasonForTravel        | businessName | businessType | indian | oci |
      | Company Sponsored Trip | xyz testing  | Pvt. Ltd     | Yes    | No  |
    Then Verify Documents with the Purpose Selected Docs and continue
      | Pan Card                                 |
      | Passport Front Page                      |
      | Passport Back Page                       |
      | Air Ticket showing travel within 60 days |
      | Valid Visa (If not on arrival)           |
    And user selected or added new address and proceed to Review Screen
    Then Add on sim cards verify and add
    And to verify Service charge & paid from given bank Details
      | payMode     | bankName      | accountNumber  | ifscCode    | remark             | upiId               |
      | Net Banking | HDFC Bank | 50100047217264 | HDFC0001409 | Tested by Automate | d.biswajeetdas3@ibl |

  @prodwww @prodsmoketest @d
  Scenario: 5 To Verify minimum amount for buy currency from better rate request
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product        | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Currency Notes | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    Then edit forex amount to '2500' USD or equivalent to 20000 INR in other currency & proceed

  @prodwww
  Scenario: 6  To Verify TCS calculation for order buy card-BetterRateRequest(Leisure Visit)
    Given User opens BookMyForex url is 'bookmyforex.com/'
    When User enters correct credentials 'test.health100@yopmail.com', '7080234123' & 'Bmf@123456'
    And User given all below details to create Better rate request
      | city               | currency | orderType | forexAmount | product    | orderFrom           |
      | Gurugram / Gurgaon | Euro     | buy       |        8000 | Forex Card | Better Rate Request |
    Then Need to select better rate cashback order to continue
      | choice               |
      | continueWithCashBack |
    And User proceed from home screen with order Details
    And Verify pan customer details if not then add below details
      | pan        | tcountryOne | tcountryTwo                    | departAfterToday | returnAfterToday |
      | BFAPL9762A | Australia   | United States of America (USA) |               10 |               20 |
    When Select purpose as 'Leisure/ Holiday/ Personal Visit'
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
