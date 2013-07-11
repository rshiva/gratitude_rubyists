require 'action_mailer'
class GratitudeMail < ActionMailer::Base

		#To-do option to add from_id if default id is not present
  ActionMailer::Base.view_paths = File.expand_path("../../views", __FILE__)
  ActionMailer::Base.raise_delivery_errors = true

	@@send_mail_to_id_list=[]

	def send_mail(author_email_id,from_id = nil)
		@to = author_email_id if author_email_id
		@from = "rjim86@gmail" #ActionMailer::Base.smtp_settings[:user_name] 
		@subject    = " Hey ,Thanks for this awesome gem "
		mail(:to => @to ,:from => @from ,:subject => @subject) do |format|
     	format.text {render :text => "hello" }
     	#format.html
    end
  end

	def add_email_to_list(send_mail_id)
		if send_mail_id.is_a?(Array)
			send_mail_id.each do |id|
			  unless @@send_mail_to_id_list.include?(id) 
			 	  @@send_mail_to_id_list << id 
			 	  self.send_mail(send_mail_id)
			  end
		  end
		elsif send_mail_id.is_a?(String) 
			unless @@send_mail_to_id_list.include?(send_mail_id) 
			 	@@send_mail_to_id_list << send_mail_id
			 	self.send_mail(send_mail_id)
			end
		end
	end

end