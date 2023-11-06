module AuthenticationHelper
  def register(user)
    register_with(full_name: user.full_name, email: user.email, password: user.password)
  end

  def login(user)
    login_with(email: user.email, password: user.password)
  end

  def login_with(email:, password:)
    visit path_for('login')
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Continue"
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

  def resend_confirmation_instructions_for(email:)
    visit path_for('resend confirmation instructions')
    fill_in "Email", with: email
    click_button "Continue"
  end

  def request_reset_password_for(email:)
    visit path_for('forgot password')
    fill_in "Email", with: email
    click_button "Continue"
  end

  def reset_password(user)
    new_password = user.password + "New"

    fill_in "New password", with: new_password
    fill_in "Retype new password", with: new_password
    click_button "Continue"
  end

  private

  def register_with(full_name:, email:, password:)
    visit path_for('register')
    fill_in "Full name", with: full_name
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Continue"
  end
end

World(AuthenticationHelper)
