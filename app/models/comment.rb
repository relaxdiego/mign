class Comment < ActiveRecord::Base
  belongs_to :ticket, :touch => true
  belongs_to :author, :class_name => User

  validates_presence_of :subject
  validates_presence_of :ticket
  validates_presence_of :author
end
