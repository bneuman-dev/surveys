class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => 'User'
  has_many :user_surveys
  has_many :users, through: :user_surveys
end
