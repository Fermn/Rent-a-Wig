class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, PhotoUploader

  has_many :bookings, dependent: :destroy
  has_many :wigs
  has_many :wigs_booked, through: :bookings, source: :wig

  validates :name, presence: true
end
