class GratitudeMail < ActionMailer::Base

		#To-do option to add from_id if default id is not present
		 @@send_mail_to_id_list=[]

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