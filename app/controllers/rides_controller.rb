class RidesController < ApplicationController

    def create
        @ride = Ride.new(attraction_id: params[:attraction_id], user_id: current_user.id)
        if @ride.save
            flash[:notice] = @ride.take_ride
            if @ride.can_ride?
                flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
            end
            redirect_to user_path(current_user)
        else
            flash[:notice] = "Sorry, something went wrong. Please try again."
            redirect_to user_path(current_user)
        end
    end

end
