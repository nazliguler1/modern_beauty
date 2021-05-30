# feature/register.feature
Feature: Register
  As a potential member
  So that I can see information about beauty services that interest me
  I want to register for the Modern Beauty application
  
@omniauth_test1
Scenario: Register
  Given I am on the Modern Beauty landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome Tester Suny! You have signed up via github."
  And I will see "Modern Beauty"

@omniauth_test2
Scenario:  Can't Register without SUNY ID
  Given I am on the Modern Beauty landing page
  And I press "Register or Login with GitHub"
  Then I will see "ActiveRecord::RecordInvalid: Validation failed: Email must be for Binghamton University"