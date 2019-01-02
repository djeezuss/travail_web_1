class Voiture < ApplicationRecord
    belongs_to :user, optional: true
end
