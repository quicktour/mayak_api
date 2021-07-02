require 'rails_helper'

RSpec.describe Card, type: :model do
  subject { build(:card) }

  describe "is not valid without a imt_id" do
    it { should validate_presence_of(:imt_id) }
  end

  describe "is not valid without a product_name" do
    it { should validate_presence_of(:product_name) }
  end
end
