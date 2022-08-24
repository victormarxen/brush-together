class Toothbrush < ApplicationRecord
  has_many :reviews
  belongs_to :announcer, class_name: 'User', foreign_key: 'announcer_id', required: true
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :category, presence: true
  validates :daily_price, presence: true
end
