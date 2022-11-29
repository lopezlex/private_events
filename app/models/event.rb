class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  validates :description, length: {minimum: 25 }
end
