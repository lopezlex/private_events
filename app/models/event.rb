class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :registrations, dependent: :destroy
  has_many :attendees, through: :registrations, source: :user
  
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  validates :description, length: {minimum: 25 }

  scope :past, -> {where("starts_at < ?", Time.now).order("starts_at")}
  scope :upcoming, -> {where("starts_at > ?", Time.now).order("starts_at")}
end
