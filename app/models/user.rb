class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :trackable
  
  has_person_name

  ROLES = ["Particulier", "Agence", "Admin"].sort
  
  has_many :properties
  
  validates :name, presence: true
  validates :role, presence: true
  
  # validates :phone_number, presence: true, on: :update
  
  before_save :administrator
  
  private
  
  def administrator
    if self.email == "francel.webdev@gmail.com"
      self.role = "Admin"
    end
  end
  
end