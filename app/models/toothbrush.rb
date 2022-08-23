class Toothbrush < ApplicationRecord
  has_many :reviews
  belongs_to :announcer, class_name: 'User', foreign_key: 'announcer_id', required: true
  has_many_attached :photos
end
