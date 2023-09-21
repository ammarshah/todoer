require 'rails_helper'

RSpec.describe Tagline, type: :model do
  describe "validations" do
    context "with text" do
      it "saves successfully" do
        taglines_count = Tagline.count
        create(:tagline)

        expect(Tagline.count).to eq(taglines_count + 1)
      end
    end

    context "without text" do
      it "does not save successfully" do
        taglines_count = Tagline.count
        invalid_tagline = build(:tagline, text: "")

        expect{ invalid_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Tagline.count).to eq(taglines_count)
      end
    end

    context "with existing text" do
      it "does not save successfully" do
        tagline = create(:tagline, text: "What an amazing tagline!")
        taglines_count = Tagline.count
        duplicate_tagline = build(:tagline, text: "What an amazing tagline!")

        expect{ duplicate_tagline.save! }.to raise_error(ActiveRecord::RecordInvalid)
        expect(Tagline.count).to eq(taglines_count)
      end
    end
  end

  describe ".random" do
    context "with exclude_id argument" do
      it "never returns a tagline whose id is exclude_id" do
        tagline = create(:tagline, id: 1)

        expect(Tagline.random(exclude_id: 1)).to be_nil
      end
    end
  end
end
