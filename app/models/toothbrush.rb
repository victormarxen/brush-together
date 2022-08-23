class Toothbrush < ApplicationRecord
  has_many :reviews
  belongs_to :announcer, class_name: 'User', foreign_key: 'announcer_id', required: true
  has_many_attached :photos

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :color, presence: true
  validates :category, presence: true
  validates :daily_price, presence: true
end
