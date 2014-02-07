class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :possible_answer
  belongs_to :user

  validates :user_id, :possible_answer_id, :presence => true
end
