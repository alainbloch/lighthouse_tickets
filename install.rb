require 'fileutils'

# Install JS file
puts "Installing Lighthouse Tickets javascript file"
js_path   = '/public/javascripts/lighthouse_tickets.js'
js_target = File.dirname(__FILE__) + "/../../..#{js_path}"
FileUtils.cp File.dirname(__FILE__) + js_path, js_target unless File.exist?(js_target)

# Install CSS file
puts "Installing Lighthouse Tickets css file"
css_path   = '/public/stylesheets/lighthouse_tickets.css'
css_target = File.dirname(__FILE__) + "/../../..#{css_path}"
FileUtils.cp File.dirname(__FILE__) + css_path, css_target unless File.exist?(css_target)

# Install View Directory
puts "Installing Lighthouse Tickets view folder"
dir_target = File.dirname(__FILE__) + "/../../../app/views/lighthouse_tickets"
FileUtils.mkdir(dir_target) unless File.exist?(dir_target)

# Install View Form
puts "Installing Lighthouse Tickets form into view folder"
form_path   = "/views/lighthouse_tickets/_form.html.erb"
form_target = File.dirname(__FILE__) + "/../../../app/#{form_path}"
FileUtils.cp File.dirname(__FILE__) + form_path, form_target unless File.exist?(form_target)


#dump sample values into environment.rb

default_values = <<-VALUES

###################################################
#
# Lighthouse Ticket Configuration
#

#specifies the revision number of the application - works with SVN not GIT! Change if neccessary..
LighthouseTickets::LighthouseTicket.revision = IO.popen("svn info").readlines[4].match(/(\d+)/)[1]  rescue nil

#replace with your account name (first part of the domain name for Lighthouse)
LighthouseTickets::LighthouseTicket.account  = "awesome"		

#replace with your valid Lighthouse Token (from the "My Profile" section in Lighthouse)
LighthouseTickets::LighthouseTicket.token     = "12j3hl4jkh4jk13h2jk4h2jk1"

# You can find this through your URL when you click on the project
LighthouseTickets::LighthouseTicket.project   = "1234-awesome"					

# The name of your application to make it feel localized, leave blank if you do not care.
LighthouseTickets::LighthouseTicket.site_name = "Awesome Rails Application"	

VALUES

puts "Writing Lighthouse Ticket config information to environment.rb"
File.open(File.dirname(__FILE__) + "/../../../config/environment.rb", File::WRONLY | File::APPEND) do |environment_rb|
  environment_rb << default_values
end

puts "This plugin requires the Lighthouse-Api Rails plugin (http://lighthouseapp.com/api)"

puts "================================Installation Complete!==========================================="

puts IO.read(File.join(File.dirname(__FILE__), 'README'))