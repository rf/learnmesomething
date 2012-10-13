# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    user nil
    title "MyString"
    description "MyText"
    upvotes 1
    downvotes 1
  end
end
