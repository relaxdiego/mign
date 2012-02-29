FactoryGirl.define do
  factory :item do
    subject "Don't forget the milk"
    points 3
    description "Buy milk from the grocery before going home."
  end

  factory :group do
    name              "Some group"
    description       { "Tasks for group #{name} go here" }
    archived          false
    tasks_updated_at  "2012-02-29 23:51:34"
  end
  factory :membership do
    user_id   { |a| a.association(:user)  }
    group_id  { |a| a.association(:group) }
    level     1
  end
end