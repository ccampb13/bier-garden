class BeersController
  def initialize(origin_region)
    @origin_region = origin_region
  end

  def add
    puts "What brewery do you want to add in #{@origin_region.name}?"
    brewery = clean_gets
    puts "Where is it located?"
    location = clean_gets
    puts "Please enter in a description for this brewery"
    description = clean_gets
    beer = Beer.create(brewery: brewery, location: location, description: description, region: @origin_region)
    if beer.new_record?
      puts beer.errors.full_messages
    else
      puts "#{brewery} has been added to list of breweries in #{@origin_region.name}"
    end
  end

  def list
    puts "=============="
    puts "#{@origin_region.name.upcase} BREWERIES"
    puts "=============="
    beers.each_with_index do |beer, index|
      puts "#{index + 1}. #{beer.brewery} | #{beer.location} | #{beer.description}"
    end
    Router.navigate_beers_menu(self)
  end

  def view(path_number)
    beer = beers[path_number - 1]
    if beer
      puts "We're traveling to #{beer.brewery} to try some of their beers on tap !"
      puts "==========="
      puts "#{beer.brewery}"
      puts "#{beer.location}"
      puts "#{beer.description}"
      selection_controller = Controller.new(beer)
      # beers_controller.list
    else
      puts "Sorry, brewery #{path_number} doesn't exist."
    end
  end

  private

  def beers
    @beers ||= @origin_region.beers
  end
end

# t.string :brewery
# t.string :location
# t.string :name
# t.string :style
# t.text   :description
