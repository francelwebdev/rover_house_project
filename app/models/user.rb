class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  devise :confirmable, :trackable 

  rolify
  
  has_many :properties
  
  validates :first_name, :last_name, presence: true, on: :update
  
end
