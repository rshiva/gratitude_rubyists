require 'action_mailer'
class GratitudeMail < ActionMailer::Base

		#To-do option to add from_id if default id is not present
		append_view_path File.expand_path("../../views", __FILE__)
		puts "==>",File.expand_path("../../views", __FILE__)
    ActionMailer::Base.raise_delivery_errors = true

		 @@send_mail_to_id_list=[]

		def send_mail(author_email_id,from_id = nil)
			@to = author_email_id if author_email_id
			@from = "rjim86@gmail" #ActionMailer::Base.smtp_settings[:user_name] 
			@subject    = " Hey ,Thanks for this awesome gem "
			mail(:to => @to ,:from => @from ,:subject => @subject) do |format|
      	format.text
      	format.html
      end
    end

				#check_mail_list(@to)
			#end 
		#end

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