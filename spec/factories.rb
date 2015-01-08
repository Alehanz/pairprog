FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:username) { |n| "Username#{n}" }
    password "foobaroo"
    password_confirmation "foobaroo"
  end

  factory :post do
    user

    sequence(:title) { |n| "Post #{n}" }
    sequence(:description) { |n| "description of the post #{n}" }
  end

  factory :comment do
    user
    post

    sequence(:comment_body) { |n| "comment body text #{n}" }
  end

end
