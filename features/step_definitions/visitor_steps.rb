


When /I visit Foobar's micropost page/ do
  foobar = User.find_by_email("foobar@example.com")
  foopost = foobar.microposts.first
  foopost.class.should be :micropost
  visit micropost_path(foopost)
end