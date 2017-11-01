class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

   has_many :topics
   belongs_to :category, optional: true #will help save the user upon signing up other wise it give an error of category must exist
   has_many :speakerarchives


  def checkallfields
    if self.id != nil
       if self.name ==  nil || self.education == nil || self.biography == nil|| self.website == nil
         return false
       else
         return true
       end
    end
  end

  #omniauth methods

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
     data = access_token.info
     user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
     if user
       return user
     else
       registered_user = User.where(:email => access_token.info.email).first
       if registered_user
         return registered_user
       else
         user = User.create(name: data["name"],
           provider:access_token.provider,
           email: data["email"],
           uid: access_token.uid ,
           password: Devise.friendly_token[0,20],
         )
       end
    end
  end
end
