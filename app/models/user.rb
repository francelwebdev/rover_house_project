class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 devise :confirmable, :trackable 

 belongs_to :role
 has_many :properties
 
  has_person_name

  validates :name, :role, presence: true, on: :create
  validates :first_name, :last_name, presence: true, on: :update
  
end
