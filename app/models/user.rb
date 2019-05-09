class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :trackable
  
  has_person_name
  has_one :profile, inverse_of: :user, dependent: :delete

  ROLES = ["Particulier", "Agence", "Admin"].sort
  
  has_many :properties, inverse_of: :user, dependent: :delete_all
  
  validates :name, :role, presence: true, on: :create
  validates :first_name, :last_name, :phone_number, presence: true, on: :update
  validates :phone_number, length: { minimum: 8 }, numericality: { only_integer: true }, on: :update
  validates :phone_number, uniqueness: true, on: :update
  
  before_create :is_administrator
  after_create :build_profile
  
  private
  
  def is_administrator
    if self.email == "francel.webdev@gmail.com"
      self.role = "Admin"
      self.is_admin = true
    end
  end

  def build_profile
    self.create_profile!
  end
  
end