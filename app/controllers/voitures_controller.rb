class VoituresController < ApplicationController
    def index
        @voitures = Voiture.where(user_id: current_user.id)
    end

    def new
        @voiture = Voiture.new
    end

    def create
        @voiture = Voiture.create!(voiture_params)
        @voiture.user_id = current_user.id
        if voiture_validations(@voiture)
            @voiture.save
        end
        respond_to do |format|
            format.html { redirect_to voitures_url }
            if voiture_validations(@voiture)
                format.js
            end
        end
    end

    def update
        byebug
        @voiture = Voiture.find(params[:id])
        if voiture_validations(@voiture)   
            @voiture.update_attributes!(voiture_params)
        end
        respond_to do |format|
            format.html { redirect_to voitures_url }
            if voiture_validations(@voiture)
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

    def voiture_validations(voiture)
        return voiture.annee.to_i > 1900 && voiture.annee.to_i <= Time.current.year && voiture.marque.present? && voiture.couleur.present?
    end

    def voiture_params
        params.require(:voiture).permit(:marque, :couleur, :annee)
    end
end
