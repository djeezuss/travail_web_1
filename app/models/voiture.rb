class Voiture < ApplicationRecord
    belongs_to :user, optional: true

    validates :marque, :couleur, presence: true
    validate :valid_date    

    def expiration_date_cannot_be_in_the_past
        errors.add(:expiration_date, "can't be in the past") if
            !expiration_date.blank? and expiration_date < Date.today
    end
    
    def valid_date
        errors.add(:annee, "Année non valide") if
            !annee.blank? and (annee > Time.current.year or annee < 1900)
    end
end
