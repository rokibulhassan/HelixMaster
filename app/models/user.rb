class User < ActiveRecord::Base
  ROLES = %w[admin guest]
  #has_and_belongs_to_many :roles_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         :recoverable,
         :rememberable,
         :trackable
  #:validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :rlcode, :role
  # attr_accessible :title, :body

  def admin?
    self.role == 'admin'
  end
end
