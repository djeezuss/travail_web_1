class VoituresController < ApplicationController
    def index
        @voitures = Voiture.where(user_id: current_user.id)
    end

    def new
        @voiture = Voiture.new
    end

    def create
        @voiture = Voiture.create(voiture_params)
        @voiture.user_id = current_user.id
        @success = @voiture.save
        if @success == false
            @error_msg = @voiture.errors.full_messages
        end
        respond_to do |format|
            format.html { redirect_to voitures_url }
            format.js
        end
    end

    def update
        @voiture = Voiture.find(params[:id])
        @success = @voiture.update(voiture_params)
        if @success == false
            @error_msg = @voiture.errors.full_messages
        end
        respond_to do |format|
            format.html { redirect_to voitures_url }
            format.js
        end
    end
  
    def destroy
        @voiture = Voiture.destroy(params[:id])
        respond_to do |format|
            format.html { redirect_to voitures_url }
            format.js
        end
    end

    private

    def voiture_params
        params.require(:voiture).permit(:marque, :couleur, :annee)
    end
end
