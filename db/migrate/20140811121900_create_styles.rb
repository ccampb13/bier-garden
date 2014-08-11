class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :style
      t.string :abv


      t.references :beer
    end
  end
end
