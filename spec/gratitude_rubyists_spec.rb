require 'spec_helper'

describe GratitudeRubyists do 
	let(:gem_file_path){"/Users/shiva/github/desidime_1.0/Gemfile"}
	let(:mail_id){ ["rjim86@gmail.com","shiva.kumar@desidime.com"]}

	it "should call get_list_of_gem method" do
   subject.send_the_mail.should_receive(:get_list_of_gem).with(gem_file_path)
	end
end