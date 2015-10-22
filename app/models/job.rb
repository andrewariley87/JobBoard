class Job < ActiveRecord::Base
  validates_presence_of :description
	validates :title, presence: true
end
