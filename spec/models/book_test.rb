require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:author).class_name("User") }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:title) }
  end
end
