class Ticket < ActiveRecord::Base
  belongs_to :workspace

  validates_presence_of :workspace
  validates_presence_of :subject
end
