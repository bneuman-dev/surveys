class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  has_many :possible_answers

  validates :question, :survey_id, :presence => true
end
