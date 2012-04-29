Feature: Using the new site in the same way as the old site. 
  As an exeperienced user of the Aberdeen Course Catalogue
  I expect to be able to use existing workflows with the new site

  Scenario: Getting to the list of second year Arabic courses
    Given I am on the home page
    When I click on Arabic
    And I click on Level 2
    Then I should see the Level 2 Arabic courses
