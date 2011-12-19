class Comment < ActiveRecord::Base
  belongs_to :article

  validates :name, :email, :body, :presence => true
  validate :article_should_be_published
  
  before_create :email_article_author

  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end
  
  def email_article_author
  	puts "We will notify #{article.user.email} in Chapter 9"
  end
end
