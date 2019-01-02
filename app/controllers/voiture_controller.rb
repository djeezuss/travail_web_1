class VoitureController < ApplicationController
    def index
        @voitures = Voiture.where(user_id: current_user.id)
        @has_voitures = @voitures.count > 0
    end
end
