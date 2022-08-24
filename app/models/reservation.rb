class Reservation < ApplicationRecord
  belongs_to :toothbrush
  belongs_to :booker, class_name: 'User', foreign_key: 'booker_id', required: true
end
