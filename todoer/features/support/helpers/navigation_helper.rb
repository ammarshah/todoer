module NavigationHelper
  include Rails.application.routes.url_helpers

  # Maps a page name to a path.
  # You may need to add more mappings in this method.
  #
  # Here is an example that pulls values out of the Regexp:
  #
  #   when /^(.*)'s profile page$/i
  #     user_profile_path(User.find_by_login($1))
  def path_for(page_name)
    case page_name
    when 'home' then root_path
    else
      begin
        send(generate_named_route_helper_method_for(page_name))
      rescue
        raise "Can't find page mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  private

  def generate_named_route_helper_method_for(page_name)
    page_name.split(' ')
      .push('path')
      .join('_')
      .to_sym
  end
end

World(NavigationHelper)
