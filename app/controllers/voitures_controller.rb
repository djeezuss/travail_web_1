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
        success = @voiture.save
        respond_to do |format|
            format.html { redirect_to voitures_url }
            if success
                format.js
            end
        end
    end

    def update
        @voiture = Voiture.find(params[:id])
        success = @voiture.update(voiture_params)
        respond_to do |format|
            format.html { redirect_to voitures_url }
            if success
                format.js
            end
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
