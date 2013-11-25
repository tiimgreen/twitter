FactoryGirl.define do
  factory :user do
    name     "Tim Green"
    username "tim"
    email    "tim@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end