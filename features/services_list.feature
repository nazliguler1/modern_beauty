Feature: Display services list
    As a user
    So that I can clearly see what providers are available
    I want to be able to see a list of beauty services  
    
    
Background: authorization and user in database

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester Suny| stester@binghamton.edu |
  
@omniauth_test5
Scenario: User sees the services list
  Given I am logged into Modern Beauty
  And I am on the Modern Beauty services list page
  Then I should see "Modern Beauty - Services"