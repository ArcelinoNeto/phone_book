class Contact < ApplicationRecord
    belongs_to :user
    validates_presence_of :name, :number
end
