class Toothbrush < ApplicationRecord
  has_many :reviews, dependent: :delete_all
  belongs_to :announcer, class_name: 'User', foreign_key: 'announcer_id', required: true
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reservations, dependent: :delete_all

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :category, presence: true
  validates :daily_price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_info,
  against: %i[title location color category],
  using: {
    tsearch: { prefix: true }
  }
end
