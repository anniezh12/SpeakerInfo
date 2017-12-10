class User < ApplicationRecord
  

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    devise :omniauthable, omniauth_providers: [:google_oauth2]
   has_many :topics
   # has_many forums, through: :topics
   # accept_nester_attributes_for :category(which has a title,description,sup_category)
   belongs_to :category, optional: true #will help save the user upon signing up other wise it give an error of category must exist

   #has_many :speakerarchives, through: :topics

 #accepts_nested_attributes_for :category, is actually equivalent to the following custom method

    def category_attributes=(category_attributes)
        c = Category.create(category_attributes)
        self.category_id = c.id

    end

     def is_admin?
       self.admin
     end

     def self.user_with_most_lectures
       lecture_count = 0;
       user_with_most_lectures = 2;
        User.all.each {|user| if (user.topics.count >= lecture_count)
                                lecture_count = user.topics.count
                                 user_with_most_lectures = user.id
                               else
                                  lecture_count
                              end }
                             return user_with_most_lectures
      end


      def self.user_with_least_lectures

              lecture_count = 0;
              user_with_least_lectures = 1;
        User.all.each {|user| if user.topics.count <= lecture_count
                        lecture_count = user.topics.count
                         user_with_least_lectures = user.id
                       else
                         lecture_count
                       end}
              return user_with_least_lectures

       end

  def checkallfields?
    if self.id != nil
       if  self.name ==  nil || self.education == nil || self.biography == nil|| self.website == nil
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
            password: Devise.friendly_token[0,20],)
        end
     end
  end
end
