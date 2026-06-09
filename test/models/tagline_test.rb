require "test_helper"
require "test_helpers/builders/tagline_builder"

class TaglineTest < ActiveSupport::TestCase
  include TaglineBuilder

  test "is valid with valid attributes" do
    assert_predicate build_tagline, :valid?
  end

  test "requires text" do
    tagline = build_tagline(text: "")

    assert_not tagline.valid?
    assert tagline.errors.added?(:text, :blank)
  end

  test "requires unique text" do
    duplicate = build_tagline(text: taglines(:default).text)

    assert_not duplicate.valid?
    assert_equal :taken, duplicate.errors.details[:text].first[:error]
  end

  test "requires lang" do
    tagline = build_tagline(lang: "")

    assert_not tagline.valid?
    assert tagline.errors.added?(:lang, :blank)
  end

  test "requires lang_code" do
    tagline = build_tagline(lang_code: "")

    assert_not tagline.valid?
    assert tagline.errors.added?(:lang_code, :blank)
  end
end
