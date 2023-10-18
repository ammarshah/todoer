require 'rails_helper'

RSpec.describe Tagline, type: :model do
  it "saves with valid attributes" do
    tagline = build(:tagline)

    expect { tagline.save! }.to change(Tagline, :count).by(1)
  end

  it "does not save without a text" do
    invalid_tagline = build(:tagline, text: "")

    expect { invalid_tagline.save! }.to raise_error("Validation failed: Text can't be blank")
  end

  it "does not save with an existing text" do
    tagline = create(:tagline, text: "What an awesome tagline!")
    duplicate_tagline = build(:tagline, text: "What an awesome tagline!")

    expect { duplicate_tagline.save! }.to raise_error("Validation failed: Text has already been taken")
  end

  it "does not save without a lang" do
    invalid_tagline = build(:tagline, lang: "")

    expect { invalid_tagline.save! }.to raise_error("Validation failed: Lang can't be blank")
  end

  it "does not save without a lang_code" do
    invalid_tagline = build(:tagline, lang_code: "")

    expect { invalid_tagline.save! }.to raise_error("Validation failed: Lang code can't be blank")
  end
end
