require "test_helper"
require "capybara/cuprite"
require "test_helpers/system_test_helpers/screencast_helper"
require "test_helpers/system_test_helpers/common_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include ScreencastHelper
  include CommonHelper

  driven_by :cuprite, screen_size: [ 1400, 1400 ]
end
