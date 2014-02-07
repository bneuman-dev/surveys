class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_surveys
  has_many :surveys_taken, through: :user_surveys, source: :survey
  has_many :surveys, foreign_key: 'creator_id'

  # Signup/Signin Validaitons
  attr_reader :entered_password

  validates :name, :length => { :minimum => 3, :message => "must be at least 3 characters, fool!" }
  validates :entered_password, :length => { :minimum => 6 }
  validates :email, :uniqueness => true, :format => /.+@.+\..+/

  # def surveys_taken
  #   user_surveys.map{|survey_taken| survey_taken.survey }
  # end

  # Login methods

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil # either invalid email or wrong password
  end

end
