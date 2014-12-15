require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should ensure_length_of(:title).
       is_at_most(200) }
  it { should ensure_length_of(:description).
       is_at_most(3000) }
end
