class RemoveNameAndStyleColumnsBeers < ActiveRecord::Migration
  def change
    remove_column :beers, :style, :string
    remove_column :beers, :name, :string
  end
end
