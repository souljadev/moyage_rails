require "test_helper"
require "pry"

class ArticleTest < ActiveSupport::TestCase

  test "article saved successfully" do
    user = User.new(username: "test1", email: "test1@gmail.com", password_digest: "123")
    
    user.save

    article = Article.new(
      title: "Hello I am a test", 
      description: "Test Description",
      user_id: user.id
    )
    assert(article.save)
    user.delete
  end

  test "should not save article without valid user" do
    article = Article.new(
      title: "Hello", 
      description: "Test Description"
    )
    article.save
    assert article.errors.full_messages, "User must exist"
  end  

  test "should not save article without title" do
    article = Article.new(description: "Test Description")
    assert_not article.save, "Article was successfully created"
  end

  test "should not save article without description" do
    article = Article.new(title: "Test Title")
    assert_not article.save, "Saved the article without a title"
  end  

end
