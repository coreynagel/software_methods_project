


When /I visit Foobar's micropost page/ do
  foobar = User.find_by_email("foobar@example.com")
  foopost = foobar.microposts.first
  visit microposts_path(foopost)
end