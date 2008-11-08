require File.dirname(__FILE__) + '/spec_helper_in_rails_context'

class Blog < ActiveRecord::Base
  has_many :replies
  attr_accessor :title
  attr_accessor :body
end

class Reply < ActiveRecord::Base
  belongs_to :blog
  attr_accessor :author
  attr_accessor :body
end

Blog.blueprint do
  title "An Example Post"
  body  { "The quick brown fox." }
end

Reply.blueprint do
  blog
  author "Fred Bloggs"
  body   "Just a comment."
end

describe Machinist do
  it "doesn't make new records for the association object" do
    blog = Blog.make
    reply = blog.replies.make
    reply.author.should == "Fred Bloggs"
    reply.blog.should == blog
  end
end