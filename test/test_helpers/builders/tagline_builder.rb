module TaglineBuilder
  def build_tagline(**attrs)
    Tagline.new(
      {
        text: "A valid tagline",
        lang: "English",
        lang_code: "en"
      }.merge(attrs)
    )
  end
end
