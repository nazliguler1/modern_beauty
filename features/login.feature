# features/login.feature
Feature: Login
  As a registered member
  So that I can see information about beauty services that interest me
  I want to login to the Modern Beauty application

Background: authorization and user in database

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester Suny| stester@binghamton.edu |

@omniauth_test3
Scenario: login
  Given I am on the Modern Beauty landing page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome back Tester Suny! You have logged in via github."
  And I will see "Modern Beauty"