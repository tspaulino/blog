require 'spec_helper'

describe Post do

  before :each do
    @user = mock_model(AdminUser)
  end

  it "should allow create a post with valid attributes" do
    post = Post.new(:title => "A valid title", :teaser => "A valid teaser", :text => "Lorem ipsum", :author => @user)
    post.save.should == true
  end

  it "should not create a post without a title" do
    post = Post.new(:title => "", :teaser => "A valid teaser", :text => "Lorem ipsum", :author => @user)
    post.save.should == false
    post.title = "A valid title"
    post.save.should == true
  end

  it "should not create a post without a text" do
    post = Post.new(:title => "A valid title", :teaser => "A valid teaser", :text => "", :author => @user)
    post.save.should == false
    post.text = "A valid text"
    post.save.should == true
  end

  it "should not create a post without an author" do
    post = Post.new(:title => "A valid title", :teaser => "A valid teaser", :text => "A text", :author => nil)
    post.save.should == false
    post.author = @user
    post.save.should == true
  end

  it "should be able to receive tags" do
    post = Post.new(:title => "A valid title", :teaser => "A valid teaser", :text => "A text", :author => @user)
    post.save.should == true
    post.tag_list = "tag 1, tag 2, tag 3"
    post.save
    post.tags.count.should == 3
  end

  it "should generate a slug with a given title" do
    post = Post.new(:title => "A valid title", :teaser => "A valid teaser", :text => "A text", :author => @user)
    post.save.should == true
    post.slug.should == "a-valid-title"
  end

end
