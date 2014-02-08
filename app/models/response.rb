class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :possible_answer
  belongs_to :user

  validates :user_id, :possible_answer_id, :presence => true
  validate :survey_taken_already

  def survey_taken_already
    survey_id = possible_answer.question.survey.id
    errors[:base] << "The survey has already been taken." if User.find(user_id).surveys_taken.exists?(survey_id)
  end
end
