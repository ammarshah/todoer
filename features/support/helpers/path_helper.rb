module PathHelper
  include Rails.application.routes.url_helpers

  PAGE_TO_PATH_MAPPINGS = {
    'home'                             => :root_path,
    "resend confirmation instructions" => :confirm_path
  }

  def path_for(page)
    path_helper_method = PAGE_TO_PATH_MAPPINGS[page] ||
      path_helper_method_for(page)

    begin
      send(path_helper_method)
    rescue
      raise "Can't find mapping from \"#{page}\" page to a path.\n" +
        "Add this mapping at #{__FILE__}:in `PAGE_TO_PATH_MAPPINGS`"
    end
  end

  private

  # Usage example:
  #
  #   path_helper_method_for('edit user') => :edit_user_path
  #
  def path_helper_method_for(page)
    page.split(' ')
      .push('path')
      .join('_')
      .to_sym
  end
end

World(PathHelper)
