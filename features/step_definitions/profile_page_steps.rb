require 'uri'
require 'cgi'

Then /^(?:I )should see the following user information: (.*)$/ do |info_list|
	info = info_list.split(',')
end

Then /^(?:I )should see "(.*?)" on (?:.*\s)wall$/ do |posts|
	#
end


Then /^(?:I )should see the "(.*?)" on the wall$/ do |post|
	#
end

Given /^(?:I )am not a friend of someone$/ do
	#
end

Then /^(?:I )should see a "(.*?)" button$/ do |button|
	#
end