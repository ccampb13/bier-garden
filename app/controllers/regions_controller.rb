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

  def list
    puts "=============="
    puts "Regions"
    puts "=============="
    regions.each_with_index do |region, index|
      puts "#{index + 1}. #{region.name}"
    end
    Router.navigate_regions_menu(self)
  end

  private

  def regions
    @regions ||= Region.all
  end
end
