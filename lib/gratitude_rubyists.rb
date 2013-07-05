require "gratitude_rubyists/version"

module GratitudeRubyists
  # Your code goes here...
  @@send_mail_to_list=[]
  gem_file_path=File.expand_path('../Gemfile', __FILE__) || ENV['BUNDLE_GEMFILE']

  def get_list_of_gem(gem_file_path)
		File.open(gem_file_path).read.each_line do |i|
			if i.start_with?("gem")
			  i=i.gsub("gem","").strip
			  gem_name=i.to_s.split(",").first
			  gem_name=eval gem_name
			  author_email_id=Gem::Specification.find_by_name(gem_name).email
			  GratitudeMail.send_mail(author_email_id)
			  author_name=Gem::Specification.find_by_name(gem_name).name
		  elsif i.start_with?("#")
		  	next
		  end
		end
	end

# Rails.application.config.action_mailer[:perform_deliveries]
	class GratitudeMail < ActionMailer::Base

		#To-do option to add from_id if default id is not present

		def send_mail(author_email_id,from_id = nil)
			@to = author_email_id if author_email_id
			@from =  ActionMailer::Base.smtp_settings[:user_name] 
			@subject    = " Hey ,Thanks for this awesome gem "
			if mail(:to => @to ,:from => @from ,:subject => @subject).deliver 
				check_mail_list(@to)
			end 
		end

		def check_mail_list(send_mail_id)
			if send_mail_id.to_s?(Array)
				send_mail_id.each do |id|
				 @@send_mail_to_id_list << id  unless @@send_mail_to_id_list.include?(id)
			  end
			elsif send_mail_id.to_s?(String)
				@@send_mail_to_id_list << send_mail_id
			end
			@@send_mail_to_id_list
		end

  end
end
