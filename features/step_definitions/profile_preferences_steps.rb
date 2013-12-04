Then /^(?:I )should see the new "(.*)" box$/ do |information|
	#
end

Then /^(?:I )should see no "(.*)" on my wall$/ do |posts|
	#post number = 0
end

Then /^(?:I )should see "(.*)" friend requests$/ do |pending|
	#
end

Then /^(?:I )should be able to do the following: (.*)$/ do |action_list|
	actions = action_list.split(',')
end

Then /^(?:I )should see a list of my "(.*)"$/ do |list|
	#
end