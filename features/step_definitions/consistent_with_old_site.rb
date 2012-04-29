Given /^I am on the home page$/ do
  visit root_url
end

When /^I click on ([\d\s\w]*)$/ do |clickable|
  click_on clickable
end

Then /^I should see the Level 2 Arabic courses$/ do
  puts page.body

  subject { page }
  it { should have_content "Level 4" }
  it { should have_selector ".courses" }
  subject { page.find ".courses" }
  it { should have_selector ".course" }
end

  