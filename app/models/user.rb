class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates_presence_of :email, :password
    validates :email, uniqueness:true

    scope :new_users, -> { where('DATE(created_at) = ?', Date.today)} 
    
end
