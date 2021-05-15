Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Modern Beauty")
end

Then(/^I should go to the About page$/) do
  expect(page).to have_content("About Modern Beauty")
end

Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create! profile
  end 
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create! user
  end 
end

Given /the following services exist/ do |services_table|
  services_table.hashes.each do |service|
    Service.create service
  end 
end

Given /the following authorizations exist/ do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create! authorization
  end 
end

 Then /^I will see "([^"]*)"$/ do |message|
   expect(page.body).to have_content(message)
 end


Given /I am logged into Modern Beauty/ do
  steps %Q{
    Given I am on the Modern Beauty landing page   
    And I press "Register or Login with GitHub"
    And I am on the Modern Beauty services list page
    }
end