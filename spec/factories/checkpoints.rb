# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkpoint do
    description "MyString"
    bucket_id 1
  end
end
