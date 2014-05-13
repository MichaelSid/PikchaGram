# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :michael, class: 'User' do
  	email 'michael@example2.com'
  	password '12345678'
  	password_confirmation '12345678'
  end

 factory :kevin, class: 'User' do
  	email 'kevin@example3.com'
  	password '12345678'
  	password_confirmation '12345678'
  end

end
