class Response < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :possible_answer
  belongs_to :user
end
