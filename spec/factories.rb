# NOTE: This is shared by cucumber and rspec

FactoryGirl.define do
  factory :ticket do
    subject     "Don't forget the milk"
    points      3
    description "Buy milk from the grocery before going home."
  end

  factory :workspace do
    name              "Some workspace"
    description       { "Tasks for workspace #{name} go here" }
    archived          false
    tasks_updated_at  "2012-02-29 23:51:34"
  end

  factory :user do |user|
    user.email                  "user@example.com"
    user.password               "password"
    user.password_confirmation  "password"
  end

  factory :membership do
    user_id   { |a| a.association(:user)  }
    group_id  { |a| a.association(:group) }
    level     1
  end
end