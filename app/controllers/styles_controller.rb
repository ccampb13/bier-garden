class StylesController

  def initialize(origin_beer)
    @origin_beer = origin_beer
  end

  def add
    puts "What is the name of the beer you want to add for #{@origin_beer.brewery}?"
    name = clean_gets
    puts "What style of beer is it?"
    style = clean_gets
    puts "What is the ABV?"
    abv = clean_gets
    style = Style.create(name: name, style: style, abv: abv, beer: @origin_beer)
    if style.new_record?
      puts style.errors.full_messages
    else
      puts "#{name} has been added to list of beers for #{@origin_beer.brewery}"
    end
  end

  def list
    puts "============================================================="
    puts "      #{@origin_beer.brewery.upcase} BEERS AVAILABLE ON TAP"
    puts "============================================================="
    styles.each_with_index do |style, index|
      puts  "  #{index + 1}. #{style.name} | #{style.style} | #{style.abv}% ABV |"

    end
    Router.navigate_styles_menu(self)
  end

  def view(path_number)
    style = styles[path_number - 1]
    if style
      puts "============================================================="
      puts "#{@origin_beer.brewery}: #{style.name}"
      puts style.style
      ExperiencesController.new().record(style)
    else
      puts "Sorry, beer #{path_number} doesn't exist."
    end
  end

  private

  def styles
    @styles ||= @origin_beer.styles
  end
end
