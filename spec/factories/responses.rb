# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :response do
    request nil
    user nil
    url "MyString"
    title "MyString"
    response "MyText"
    upvotes 1
    downvotes 1
  end
end
