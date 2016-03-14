class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :favorites

  def favorited?(article)
    favorites.find_by_article_id(article.id)
  end

  def add_to_favorite!(article)
    favorites.create!(article_id: article.id)
  end

  def remove_from_favorite!(article)
    favorites.find_by_article_id(article.id).destroy
  end
end
