class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :attended_events, through: :registrations, source: :event


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
