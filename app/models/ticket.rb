class Ticket < ActiveRecord::Base
  belongs_to :workspace, :touch => true
  has_many   :comments

  validates_presence_of :workspace
  validates_presence_of :subject
end
