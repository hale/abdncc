module Helpers
  def log_in( user )
    visit new_session_path
    fill_in 'email', :with => user.email
    fill_in 'password', :with => 'foobar'
    click_button 'Log in'
  end

  def log_out
    visit root_path
    begin
      click_on "Log out"
    rescue Capybara::ElementNotFound
    end
  end

end