require 'rails_helper'

RSpec.describe Tagline, type: :model do
  it "saves with valid attributes" do
    taglines_count = Tagline.count
    tagline = build(:tagline)

    expect(tagline.save!).to be_truthy
    expect(Tagline.count).to eq(taglines_count + 1)
  end
  
  it "does not save without a text" do
    taglines_count = Tagline.count
    invalid_tagline = build(:tagline, text: "")

    expect{ invalid_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Text can't be blank")
    expect(Tagline.count).to eq(taglines_count)
  end

  it "does not save with an existing text" do
    taglines_count = Tagline.count
    tagline = create(:tagline, text: "What an awesome tagline!")
    duplicate_tagline = build(:tagline, text: "What an awesome tagline!")

    expect{ duplicate_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Text has already been taken")
    expect(Tagline.count).to eq(taglines_count + 1)
  end

  it "does not save without a lang" do
    taglines_count = Tagline.count
    invalid_tagline = build(:tagline, lang: "")

    expect{ invalid_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lang can't be blank")
    expect(Tagline.count).to eq(taglines_count)
  end

  it "does not save without a lang_code" do
    taglines_count = Tagline.count
    invalid_tagline = build(:tagline, lang_code: "")

    expect{ invalid_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lang code can't be blank")
    expect(Tagline.count).to eq(taglines_count)
  end
end
