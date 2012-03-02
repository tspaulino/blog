Given /^I have published posts titled "([^"]*)"$/ do |title|
  author = !AdminUser.where(:email => "testing@domain.com").blank? ? AdminUser.where(:email => "testing@domain.com").first : AdminUser.create!(:email => "testing@domain.com", :password => "testing", :password_confirmation => "testing")
  Post.create!(:title => title, :teaser => "Any teaser", :text => "Any text", :published => true, :author => author)
end

Given /^I have unpublished posts titled "([^"]*)"$/ do |title|
  author = !AdminUser.where(:email => "testing@domain.com").blank? ? AdminUser.where(:email => "testing@domain.com").first : AdminUser.create!(:email => "testing@domain.com", :password => "testing", :password_confirmation => "testing")
  Post.create!(:title => title, :teaser => "Any teaser", :text => "Any text", :published => false, :author => author)
end

When /^I am on the posts page$/ do
  visit(posts_url)
end

Then /^I should see a post titled "([^"]*)"$/ do |title|
  page.should have_content(title)
end

When /^I publish a post titled "([^"]*)"$/ do |title|
  Post.where(:title => title).first.publish!
end

Then /^I should not see a post titled "([^"]*)"$/ do |title|
  page.should_not have_content(title)
end
