class CreateVoitures < ActiveRecord::Migration[5.2]
  def change
    create_table :voitures do |t|
      t.string     :marque
      t.string     :couleur
      t.integer    :annee
      t.references :user

      t.timestamps
    end
  end
end
