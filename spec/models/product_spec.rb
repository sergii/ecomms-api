require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:brand) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:desc) }
  end
end