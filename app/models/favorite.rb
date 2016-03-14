class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  validates :user, presence: true
end
