module AuthenticationHelper
  def register(user)
    register_with(email: user.email, password: user.password)
  end

  def login(user)
    login_with(email: user.email, password: user.password)
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

  def confirm_email
    deliver_enqueued_emails
    visit confirmation_link
  end

  private

  def register_with(email:, password:)
    visit path_for('register')
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Continue"
  end

  def login_with(email:, password:)
    visit path_for('login')
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Continue"
  end
end

World(AuthenticationHelper)
