class User < ActiveRecord::Base
    
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    validates :name, uniqueness: true

    def mood
        happiness > nausea ? "happy" : "sad"
    end

    def update_attrs(attraction)
        self.tickets = self.tickets - attraction.tickets
        self.nausea = self.nausea + attraction.nausea_rating
        self.happiness = self.happiness + attraction.happiness_rating
        self.save!
    end
end
