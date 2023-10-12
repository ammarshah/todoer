module AuthenticationHelper
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
