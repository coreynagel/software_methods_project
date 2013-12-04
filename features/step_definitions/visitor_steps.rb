


When /I visit Foobar's micropost page/ do
  foobar = User.find_by_email("foobar@example.com")
  foobar.microposts.any?.should be true
  foopost = foobar.microposts.first
  visit micropost_path(foopost)
end