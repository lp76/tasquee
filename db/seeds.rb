# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(:name => 'Default Admin', :username => 'admin', :email => 'admin@test.com',
            :password => 'admin123', :password_confirmation => 'admin123', :admin => true,
            :show_in_calendar => false)
