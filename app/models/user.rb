class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  validates :password,  :presence => true,
                        :confirmation => true,
                        :length => {:within => 8..40},
                        :on => :create,
                        #:format => {:with => /\A.*(?=.{10,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\@\#\$\%\^\&\+\=]).*\Z/ }
                        :format => {:with => /\A.*(?=.{08,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*\Z/ }
                        
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :name, presence: true
         
  has_many :pins
end
