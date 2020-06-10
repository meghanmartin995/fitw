class Post < ApplicationRecord
  has_many :post_fonts
  has_many :fonts, through: :post_fonts
end
