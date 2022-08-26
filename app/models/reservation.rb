class Reservation < ApplicationRecord
  belongs_to :toothbrush
  belongs_to :booker, class_name: 'User', foreign_key: 'booker_id', required: true

  validate :date_is_possible?

  def date_is_possible?
    return if [start_date.blank?, end_date.blank?].any?
    if start_date > end_date
      errors.add(:end_date, 'not possible')
    end
  end
end
