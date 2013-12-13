class UserMailer < ActionMailer::Base
  default :from => '"My Rails App" <me@email.com>'

  def welcome_email ( user )
  	@user = user
  	mail( :to => user.email, :subject => "Thanks for joining Stuff Finder!" )
  end

  def posting_confirmation_email ( classified )
  	@classified = classified
  	@user = classified.user
  	mail( :to => @user.email, :subject => "Thanks for posting a classified")
  end
end
