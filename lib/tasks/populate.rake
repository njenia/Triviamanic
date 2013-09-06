namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke


    User.populate 100 do |user|
      user.username = Faker::Internet.user_name
      user.encrypted_password = Faker::Internet.password
      user.email   = Faker::Internet.email
    end

  end
end

