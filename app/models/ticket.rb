class Ticket < ActiveRecord::Base
  belongs_to :workspace, :touch => true

  validates_presence_of :workspace
  validates_presence_of :subject
end
