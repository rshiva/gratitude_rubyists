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
    puts "===>",author_email_id.class
  elsif i.start_with?("#")
  	next
  end
end

end
