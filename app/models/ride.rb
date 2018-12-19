class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        rejection = "Sorry."
        if !able_to_ride?('tickets', 'tickets')
            rejection += " You do not have enough tickets to ride the #{self.attraction.name}."
            self.can_ride = false
        end
        if !able_to_ride?('height', 'min_height')
            rejection += " You are not tall enough to ride the #{self.attraction.name}."
            self.can_ride = false
        end

        can_ride? ? user.update_attrs(attraction) : rejection
    end
    
    def able_to_ride?(user_check, attraction_check)
        self.user[user_check] >= self.attraction[attraction_check]
    end

end
