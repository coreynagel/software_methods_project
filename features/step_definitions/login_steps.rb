Given /I have an account/ do
	foobar = User.create({:first_name => "Foo",
							 	:last_name => "Bar",
								:email => "foobar@example.com",
								:password => "testing",
								:password_confirmation => "testing"})
	foobar.save!
end