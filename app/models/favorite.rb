class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :user_id, uniqueness: true, presence: true
  validates :micropost_id, presence: true
end
