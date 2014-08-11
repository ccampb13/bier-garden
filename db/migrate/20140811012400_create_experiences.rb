class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :style
      t.boolean :consumed
      t.timestamps
    end
  end
end
