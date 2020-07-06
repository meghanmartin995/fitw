class Post < ApplicationRecord
  has_many :post_fonts
  has_many :fonts, through: :post_fonts
  has_many :post_vibes
  has_many :vibes, through: :post_vibes
  accepts_nested_attributes_for :fonts, reject_if: proc { |attributes| attributes['name'].blank? }
  has_one_attached :photo
  is_impressionable
  acts_as_taggable_on :tags

  $tags = ['tech', 'classic', 'experimental', 'rising', 'trending']

  include PgSearch::Model

  multisearchable against: [:website]

  pg_search_scope :global_search,
  against: [:website],
  associated_against: {
    tags: [:name]
  },
  using: {
    tsearch: {prefix: true}
  }
  scope :is_free, -> { joins(:fonts).where(fonts: { free_commercial: true } ) }
  scope :free, -> { includes(:fonts).where(fonts: { free_commercial: true }) }

  scope :is_google, -> { joins(:fonts).where(fonts: { google: true } ) }
  scope :google, -> { includes(:fonts).where(fonts: { google: true }) }

  scope :is_squarespace, -> { joins(:fonts).where(fonts: { squarespace: true } ) }
  scope :squarespace, -> { includes(:fonts).where(fonts: { squarespace: true }) }

  scope :is_adobe, -> { joins(:fonts).where(fonts: { adobe: true } ) }
  scope :adobe, -> { includes(:fonts).where(fonts: { adobe: true }) }

  def posts_by_font(name)
    Post.joins(:fonts)
        .where(fonts: { name: name })
  end

  def next
    self.class.where("id > ?", id).first
  end

  def previous
    self.class.where("id < ?", id).last
  end
end
