class Toothbrush < ApplicationRecord
  belongs_to :announcer, class_name: 'User', foreign_key: 'user_id', required: true
  has_many_attached :photos
end
