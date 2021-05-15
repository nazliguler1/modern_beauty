# features/services_mod.feature
# feature for services modifications

Feature: Services modifications
    As a developer
    So that I can change the services's information
    I want to be able to modify Modern Beauty's services

Background: services, authorizations, and users in database

  Given the following services exist:
  |name      |category    |location                   |rating|price|
  |BU: Be You|Beauty Salon|123 Road St. Binghamton, NY|4.0   |$$   |
  
  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester Suny| stester@binghamton.edu |
  
  
@edit_service
Scenario: Developer edits service
  Given I am logged into Modern Beauty
  When I go to the edit service page for "BU Be You"
  Then I should see "Edit Service"

@destroy_service
Scenario: Developer deletes service
  Given I am logged into Modern Beauty
  And I am on the show service page for "BU: Be You"
  And I follow "Delete"
  And I go to the Modern Beauty services list page
  Then I should not see "BU: Be You"