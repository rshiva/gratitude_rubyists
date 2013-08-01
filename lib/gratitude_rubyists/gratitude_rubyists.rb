require "gratitude_rubyists/version"
autoload :GratitudeMail , "mailer/gratitude_mail"

module GratitudeRubyists
  class MailAuthors
  	#@gem_file_path=File.expand_path('../Gemfile', __FILE__) || ENV['BUNDLE_GEMFILE']  ||  Dir.pwd + "/Gemfile"
  	@gem_file_path =  Dir.pwd + "/Gemfile"

  def self.send_the_mail
  	self.get_list_of_gem(@gem_file_path)
  end
  
  #before running do bundle install
  def self.get_list_of_gem(gem_file_path)
		File.open(gem_file_path).read.each_line do |i|
			i=i.split
			if i[0] == "gem" && i[0].start_with?("gem")
			name = i[1].gsub(",","") 
			gem_name= eval name
			author_email_id=Gem::Specification.find_by_name(gem_name.to_s).email
			author_name=Gem::Specification.find_by_name(gem_name).name
			GratitudeMail.add_email_to_list(author_email_id)
		else
			next
		end
			
		end
	end

  end
end


#^gem (['"])(?:(?!\1).)*\1
#{:author_email => params[:author_email],:user_email => params[:user_email],:gem_name  => params[:gem_name]}
#curl -d '{"author_email": "Metallica", "user_email": "metallica@metalhead.com"}' -X POST -H Content-Type:application/json h//localhost:3000/api/data.json


=begin
EventMachine.run {
      #http= EventMachine::HttpRequest.new("http://localhost:3000/api/data/2.json").get
      http = EventMachine::HttpRequest.new('http://localhost:3000/api/data/').post :body => {"author_email" => "tenderlove@catworld.com", "user_email" => "supernova@s"}

      http.errback { p 'Uh oh'; EM.stop }
      http.callback {
        p http.response_header.status
        p http.response_header
        p http.response

        EventMachine.stop
      }
    }
=end
