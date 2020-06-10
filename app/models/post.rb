class Post < ApplicationRecord
  has_many :post_fonts
  has_many :fonts, through: :post_fonts
  has_many :post_vibes
  has_many :vibes, through: :post_vibes
  accepts_nested_attributes_for :fonts
  has_one_attached :photo
end
