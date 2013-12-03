Given /(?:I|Foobar) (?:have|has) an account/ do
	foobar = User.create({:first_name => "Foo",
							 	:last_name => "Bar",
								:email => "foobar@example.com",
								:password => "testing",
								:password_confirmation => "testing"})
	foobar.save!
end

Given /Foobar has a micropost/ do
  foobar = User.find_by_email("foobar@example.com")
  foopost = foobar.microposts.build[wall_id: foobar.wall, content: "blah blah blah"]
end

When /I visit Foobar's user page/ do
  foobar = User.find_by_email("foobar@example.com")
  visit user_path(foobar)
end

