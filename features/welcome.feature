# feature/welcome.feature
Feature: Display welcome page
    As a user
    I want to see and be greeted by the welcome page
    So that I can have a better experience when visiting the website
    
Scenario: User sees the welcome message
  When I go to the home page
  Then I should see the welcome message