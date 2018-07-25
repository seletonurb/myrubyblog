require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end
  test "If Title is there and body is long enough" do
    post = Post.new(:title => "Some Title", :body => "This is the post body")
    assert post.valid?
  end
  test "If Body is long enough" do
    post = Post.new(:title => "Some Title", :body => "This is the post body")
    assert post.valid?
  end
end
