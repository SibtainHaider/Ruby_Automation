Feature: Sapphire checkout

  @sapphire
  Scenario: Checking the purchase feature
    Given User is on the "web" page on "sapphire"
    When User Click on "men_btn" on "sapphire"
    And User Click on "add_bag" on "sapphire"
    Then User Click on "add_cart" on "sapphire"
    Then User Click on "check_out" on "sapphire"
#    Then User enter "email" in "email box" on "sapphire"
#    Then User enter "fname" in "fname box" on "sapphire"
#    Then User enter "lname" in "lname box" on "sapphire"
#    Then User enter "address" in "address box" on "sapphire"
#    Then User enter "city" in "city box" on "sapphire"
#    Then User enter "zipcode" in "zip box" on "sapphire"
#    Then User enter "phonenum" in "num box" on "sapphire"
    Then User Click on "continue btn" on "sapphire"