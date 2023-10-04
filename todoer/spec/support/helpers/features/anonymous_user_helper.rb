module Helpers
  module Features
    module AnonymousUserHelper
      def anonymous_user_visits_homepage
        create(:tagline, text: "Whaddya want TODO?")

        visit root_path
      end
    end
  end
end
