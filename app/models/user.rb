class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  devise :confirmable, :trackable 
  
  has_many :properties
  has_and_belongs_to_many :roles
  
  validates :first_name, :last_name, presence: true, on: :update
  
  def has_role?(name)
    role = Role.find_by(name: name)
    if self.roles.include?(role)
      true
    else
      false
    end
  end
  
end
