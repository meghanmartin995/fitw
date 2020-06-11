class Vibe < ApplicationRecord
  has_many :post_vibes
  has_many :posts, through: :post_vibes
end
