class Voiture < ApplicationRecord
    belongs_to :user, optional: true

    validates_presence_of :marque, :message => "ne peut pas être vide."
    validates_presence_of :couleur, :message => "ne peut pas être vide."
    validate :valid_date
    
    def valid_date
        errors.add(:annee, "non valide. Doit être entre 1900 et " + Time.current.year.to_s + " inclusivement.") if
            annee.blank? || (annee > Time.current.year or annee < 1900)
    end
end
