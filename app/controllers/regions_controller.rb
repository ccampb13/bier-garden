class RegionsController

  def add
    puts "What region do you want to explore?"
    name = clean_gets
    region = Region.create(name: name)
    if region.new_record?
      puts region.errors.full_messages
    else
      puts "#{name} has been added to the list of regions"
    end
  end

  # def delete
  #   puts "Which Region do you want to delete? (Enter #{Region.name})"
  #   item = clean_gets
  #   if item
  #     puts "Are your SURE you wish to PERMANENTLY DELETE this region? (y/N)"
  #     input = clean_gets.downcase
  #     if input == 'y'
  #       Region.destroy()
  #       puts "Region has been deleted."
  #     else
  #       puts "Region has NOT been deleted."
  #     end
  #   end
  # end


  def list
    puts "=============="
    puts "REGIONS"
    puts "=============="
    regions.each_with_index do |region, index|
      puts "#{index + 1}. #{region.name}"
    end
    Router.navigate_regions_menu(self)
  end

  def view(path_number)
    region = regions[path_number - 1]
    if region
      puts "We're traveling to #{region.name} to try some of their local beers !"
      puts "type 'add' to enter in a new brewery"
      beers_controller = BeersController.new(region)
      beers_controller.list
    else
      puts "Sorry, region #{path_number} doesn't exist."
    end
  end

  private

  def regions
    @regions ||= Region.all
  end
end
