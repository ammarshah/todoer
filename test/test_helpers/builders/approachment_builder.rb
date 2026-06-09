module ApproachmentBuilder
  def build_approachment(**attrs)
    Approachment.new(
      {
        name: "John Doe",
        email: "john@example.com",
        subject: "Hello",
        message: "This is a valid message"
      }.merge(attrs)
    )
  end
end
