class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :password, length: { minimum: 10 }


end
