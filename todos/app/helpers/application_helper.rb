module ApplicationHelper
  # These attributes are used by stimulus tagline_controller
  # which makes the tagline on the homepage scrollable 
  def scrollable_tagline_attributes
    if controller_name == "homepage"
      ("tabindex='0'
        autofocus
        data-controller='tagline'
        data-action='wheel->tagline#changeTagline
          keydown.up->tagline#changeTagline
          keydown.down->tagline#changeTagline
          keydown.left->tagline#changeTagline
          keydown.right->tagline#changeTagline
          keydown.home->tagline#changeTagline
          keydown.end->tagline#changeTagline
          keydown.page_up->tagline#changeTagline
          keydown.page_down->tagline#changeTagline
          touchend->tagline#changeTagline'"
      ).html_safe
    end
  end
end
