module UserBuilder
  DEFAULT_PASSWORD = "password123"

  def build_user(**attrs)
    User.new(default_user_attributes.merge(attrs))
  end

  def create_user(**attrs)
    User.create!(default_user_attributes.merge(attrs))
  end

  def default_user_attributes
    {
      full_name: "John Doe",
      email: "john#{SecureRandom.hex(4)}@example.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      confirmed_at: DateTime.now
    }
  end
end
