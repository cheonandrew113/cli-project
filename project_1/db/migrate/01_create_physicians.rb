class CreatePhysicians < ActiveRecord::Migration[5.2]
  def change
    create_table :physicians do |t|
      t.string :name
      t.integer :yrs_experience
      t.string :department
    end
  end
end
