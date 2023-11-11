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

  def logout
    if has_link?(href: path_for('logout'))
      click_link(href: path_for('logout'))
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

  def reset_password_to(new_password:)
    fill_in "New password", with: new_password
    fill_in "Retype new password", with: new_password
    click_button "Continue"
  end

  def update_account_with(full_name:)
    within("#update_account") do
      fill_in "Full name", with: full_name
      click_button "Save"
    end
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
