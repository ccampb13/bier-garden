class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewery
      t.string :location
      t.string :name
      t.string :style
      t.text   :description


      t.references :region
    end
  end
end
