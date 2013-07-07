require "gratitude_rubyists/version"

module GratitudeRubyists
  # Your code goes here...
  @@send_mail_to_list=[]
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
			#GratitudeMail.send_mail(author_email_id)
		else
			next
		end
			
		end
	end

end


#^gem (['"])(?:(?!\1).)*\1
