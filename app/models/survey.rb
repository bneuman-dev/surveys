class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => 'User'
  has_many :user_surveys
  has_many :questions
  has_many :survey_takers, through: :user_surveys, source: :user
  has_many :questions
  validates :title, :presence => true

  def resized_pic
    image = MiniMagick::Image.open(pic_url)
    image.resize "200x200"
    image.format "jpg"
    filepath = APP_ROOT.join('public','tmp',self.id.to_s + '.jpg')
    image.write filepath
    return "/tmp/#{self.id}.jpg"
  end
end
