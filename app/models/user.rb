class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 devise :confirmable, :trackable 

 ROLES = ["Particulier", "Profesionnel"]
 
  has_person_name

  validates :name, :role, presence: true
  
end
