class User < ActiveRecord::Base

  before_create :init_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
                  :role
  # attr_accessible :title, :body
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  
  has_many :projects
  has_many :templates
  has_many :libraries
  has_many :messages
  has_many :sharedmessages

  private
    def init_role
      self.role = 'NgsUser'
    end
end
