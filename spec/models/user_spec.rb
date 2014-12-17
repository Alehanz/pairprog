require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:posts) }
  it { should validate_uniqueness_of :username }
end
