class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :classifieds

  after_create :send_welcome_email

  def send_welcome_email
  	UserMailer.welcome_email(self).deliver
  end
end
