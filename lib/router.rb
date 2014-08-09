class Router
  def self.navigate_regions_menu(regions_controller)
    command = clean_gets

    case command
    when "add"
      regions_controller.add
    when /\d+/
      regions_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_beers_menu(beers_controller)
    command = clean_gets
    case command
    when "add"
      beers_controller.add
    # when /\d+/
    #   skills_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end
end
