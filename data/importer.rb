# Run from project root via. `ruby data/importer.rb`
require 'csv'
require_relative '../app/models/beer'
require_relative '../app/models/region'
require_relative '../app/models/style'
require_relative '../lib/environment'

Environment.environment = "development"
source = "data/"

CSV.foreach(source, headers: true) do |row|
  region_name = row['region']
  beer_brewery = row['brewery']
  skill_description = row['descriqtion']

  training_path = TrainingPath.all.find{ |training_path| training_path.name == training_path_name }
  training_path ||= TrainingPath.create(name: training_path_name)
  Skill.create(name: skill_name, description: skill_description, training_path: training_path)
  puts "Imported #{skill_name} into #{training_path_name} with description #{skill_description}."
end
