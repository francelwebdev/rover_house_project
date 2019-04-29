class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_person_name

  has_many :properties
  
  validates :name, presence: true
  validates :role, presence: true
  validates :phone_number, presence: true, on: :update

  ROLES = %i[Particulier Profesionnel].sort

end
