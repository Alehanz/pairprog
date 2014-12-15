FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    sequence(:description) { |n| "description of the post #{n}" }
  end

end
