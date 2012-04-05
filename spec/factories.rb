# NOTE: This is shared by cucumber and rspec

FactoryGirl.define do
  factory :ticket do
    subject     "Don't forget the milk"
    points      3
    description "Buy milk from the grocery before going home."

    association :workspace
  end

  factory :comment do
    sequence(:subject) { |n| "Comment Subject #{n}"  }
    sequence(:body)    { |n| "Comment Body #{n}"     }

    association :ticket
    association :author, :factory => :user
  end

  factory :workspace do
    sequence(:name)   { |n| "Workspace #{n}" }
    description       { |w| "Tasks for workspace #{w.name} go here" }
    archived          false
  end

  factory :user do |user|
    user.email                  { "user_#{rand(1000).to_s}@example.com" }
    user.password               "password"
    user.password_confirmation  "password"
  end

  factory :membership do
    user_id   { |a| a.association(:user)  }
    group_id  { |a| a.association(:group) }
    level     1
  end
end