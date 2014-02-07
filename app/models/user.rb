class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :surveys, :foreign_key => 'creator_id'

  def surveys_taken
    user_surveys.map{|surveys_taken|Survey.find(surveys_taken.survey_id)}
  end
end
