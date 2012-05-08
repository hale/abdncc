### Deadline: 15:00 Friday 11th May 2012 
------------

# Aberdeen University Course Catalogue

This project is for _CS2512 Advanced Web Application Development_.

## Key facts and requirements

* Must be test driven.
* Must be deployed to heroku.
* Solo project.

## Testing

For this project I wanted to be really strict about TDD.  Until I reach the design phase, I am not 
opening the browser at all but relying on tests to know everything works.  In addition, I only write
application code to pass a test - the test is used to drive functionality.

My main testing framework is RSpec. I have no experience with Test::Unit, and besides I like the readability
of RSpec.

### Unit testing
* Views were tested using RSpec integration tests.  I find it useful to be able to include some simple 
  behaviour tests like clicking on links, and (AFAIK) this is not as easy in standard RSpec view tests.

* Controllers and Models were tested with RSpec.  I learnt RoR from Michael Hartl's 'Ruby on Rails Tutorial', 
  where he advocates testing the views in the controller specs. I don't like to do that, and my controller 
  tests only test code in the app/controllers directory.

### Integration testing
Black-box integration testing is handled by Cucumber features.  

### Acceptance testing
This is a solo project with no external specifications, but I still find it useful to have acceptance tests. 
In my mind I have an idea of what I want the site to be like, and these broad ideas form the basis of acceptance
tests.  

In addition, this site is intended to replace a well-used older site.  Thanks to this talk, I want to make it possible
for existing users to use the new site like the old.  *The challenge is to add all my desired functionality without
changing the existing workflows of site users.*