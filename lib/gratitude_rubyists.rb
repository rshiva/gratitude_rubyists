require "gratitude_rubyists/version"

module GratitudeRubyists
  # Your code goes here...
gem_file_path=File.expand_path('../Gemfile', __FILE__) || ENV['BUNDLE_GEMFILE']

File.open(gem_file_path).read.each_line do |i|
	if i.start_with?("gem")
	  i=i.gsub("gem","").strip
	  gem_name=i.to_s.split(",").first
	  gem_name=eval gem_name
	  author_email_id=Gem::Specification.find_by_name(gem_name).email
	  author_name=Gem::Specification.find_by_name(gem_name).names
    puts "===>",author_email_id
  elsif i.start_with?("#")
  	next
  end
end

# Rails.application.config.action_mailer[:perform_deliveries]
class GratitudeMail < ActionMailer::Base

	def send_mail(author_email_id,author_name)
		@to = author_email_id if author_email_id
		@from =  ActionMailer::Base.smtp_settings[:user_name]
		@author_name =  author_name if author_name
		@subject    = " Hey #{@author_name} ,Thanks for this awesome gem "
		puts "===>",@to,@from,@subject
#		mail(:to => @to ,:from => ,:subject => @subject)
		
	end

	def message

	end
end
end
