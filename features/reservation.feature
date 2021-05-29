# features/reservation.feature

Feature: Make a reservation for a service
    As a registered user
    So that I can get the service I want to receive at the time and date I'm available
    I want to be able to make a reservation

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
  
@goto_reservation
Scenario: User selects to make reservation
  Given I am logged into Modern Beauty
  And I am on the Modern Beauty services list page
  And I follow "Make Reservation"
  Then I should see "Make New Reservation"