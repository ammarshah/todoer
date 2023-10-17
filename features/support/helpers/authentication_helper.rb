module AuthenticationHelper
  def register_with(email: nil, password: nil)
    visit path_for('register')
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Continue"
  end

  def login(user)
    login_with(email: user.email, password: user.password)
  end

  def login_with(email:, password:)
    visit path_for('login')
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  # For details, see https://github.com/heartcombo/devise/wiki/How-To:-Test-with-Cucumber#cucumber-testing-for-sign-out
  def logout
    current_driver = Capybara.current_driver

    begin
      Capybara.current_driver = :rack_test
      page.driver.submit :delete, path_for('logout'), {}
    ensure
      Capybara.current_driver = current_driver
    end
  end
end

World(AuthenticationHelper)
