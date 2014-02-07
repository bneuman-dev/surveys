class PossibleAnswer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question

  validates :question, :presence => true
  validates_uniqueness_of :text, :scope => :question_id
end
