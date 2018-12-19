class AttractionsController < ApplicationController
    before_action :get_attraction, only: [:show, :edit, :update]
    before_action :admin?, only: [:new, :create, :edit, :update, :destroy]

    def index
        @attractions = Attraction.all
    end

    def show
        @ride = @attraction.rides.build
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            flash[:notice] = "Please try again. Something went wrong."
            render :new
        end
    end

    def edit
    end

    def update
        @attraction.update(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end

    private

    def get_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

    def admin?
        redirect_to attractions_path unless current_user.admin?
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

end
