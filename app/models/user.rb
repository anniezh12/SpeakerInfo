class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   #validates :email, presence:true,uniqueness: true
   #validates :password, presence:true
   has_many :topics
   belongs_to :category, optional: true #will help save the user upon signing up other wise it give an error of category must exist
   has_many :speakerarchives
end
