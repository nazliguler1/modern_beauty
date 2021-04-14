# feature/welcome.feature
Feature: Display welcome page
    As a user
    I want to see and be greeted by the welcome page
    So that I can have a better experience when visiting the website
    
Scenario: User sees the welcome message
  When I go to the home page
  Then I should see the welcome message
  
Scenario: User clicks on Create Account button
  When I press "Create Account" 
  Then I should see Create Account page
  
Scenario: User clicks on Login button
  Given I am on the home page
  When I press "Login"
  Then I should see Login page
  
Scenario: User clicks on about link
  Given I am on the home page
  When I follow "About"
  Then I should be on the about page