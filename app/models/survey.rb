class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => 'User'
  has_many :user_surveys
  has_many :survey_takers, through: :user_surveys, source: :user
  has_many :questions
  validates :title, :presence => true
end
