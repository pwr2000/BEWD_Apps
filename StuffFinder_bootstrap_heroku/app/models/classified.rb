class Classified < ActiveRecord::Base
  validates :title, :description, :price, :category, :user, :presence => true

  belongs_to :category
  belongs_to :user

  mount_uploader :image, ImageUploader

  after_create :send_posting_confirmation_email

  def send_posting_confirmation_email
  	UserMailer.posting_confirmation_email(self).deliver
  end

end
