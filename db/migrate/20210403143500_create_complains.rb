class CreateComplains < ActiveRecord::Migration[6.1]
  def change
    create_table :complains do |t|
      t.string :title
      t.string :description
      t.string :city
      t.string :state
      t.string :country
      t.string :company

      t.timestamps
    end
  end
end
