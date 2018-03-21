require 'rails_helper'

describe Article, type: :model do
  describe 'validations' do
    it {should validate_precense_of(:title)}
    it {should validate_precense_of(:body)}
  end
end
