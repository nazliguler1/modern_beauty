Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Modern Beauty")
end

Then(/^I should go to the About page$/) do
  expect(page).to have_content("About Modern Beauty")
end