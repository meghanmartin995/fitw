class Font < ApplicationRecord
  has_many :font_categories
  has_many :categories, through: :font_categories
  has_many :post_fonts
  has_many :posts, through: :post_fonts
  has_many :extwebsite_fonts
  has_many :extwebsites, through: :extwebsite_fonts
  has_many :font_types
  has_many :types, through: :font_types
  #validates :name, presence: true
  include PgSearch::Model
  #multisearchable against: [:name, :designer]
  # pg_search_scope :search_by_name_and_designer,
  #   against: [ :name, :designer ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
