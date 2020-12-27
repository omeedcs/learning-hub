class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :articles
  has_many :posts
  has_many :communities, through: :subscriptions
  has_many :comments

  validates_presence_of :first_name, :last_name, :username, :ut_eid
  
  def full_name
    "#{first_name} #{last_name}"
  end 
end

