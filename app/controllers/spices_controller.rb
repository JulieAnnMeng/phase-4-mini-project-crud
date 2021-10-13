class SpicesController < ApplicationController

    def index
        spices = Spice.all 
        render json: spices, status: :ok
    end

    def create
        spice = Spice.create(permited_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(permited_params)
            render json: spice, status: :ok
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            render json: {}
        else
            render json: { error: "Spice not found" }, status: :not_found
        end
    end

    private

    def permited_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
