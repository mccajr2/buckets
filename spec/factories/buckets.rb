# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bucket do
    description "Lorem ipsum"
    user
  end
end
