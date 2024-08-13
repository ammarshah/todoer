module InteractionHelper
  def press_key(key:)
    send_keys [ key.to_sym ]
  end

  def trigger_blur
    press_key(key: 'tab')
  end
end

World(InteractionHelper)
