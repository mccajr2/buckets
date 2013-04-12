namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_buckets
    make_checkpoints
  end
end

def make_users
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_buckets
  users = User.all(limit: 15)
  5.times do
    description = Faker::Lorem.sentence(4)
    users.each { |user| user.buckets.create!(description: description) }
  end
end

def make_checkpoints
  buckets = Bucket.all(limit: 75)
  10.times do
    description = Faker::Lorem.sentence(10)
    buckets.each { |bucket| bucket.checkpoints.create!(description: description) }
  end
end