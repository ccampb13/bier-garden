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
    when /\d+/
      beers_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  def self.navigate_styles_menu(styles_controller)
    command = clean_gets
    case command
    when "add"
      styles_controller.add
    when /\d+/
      styles_controller.view(command.to_i)
    else
      puts "I don't know the '#{command}' command."
    end
  end

  # def self.navigate_experiences_menu(experiences_controller)
  #   command = clean_gets
  #   case command
  #   when "list"
  #     experiences_controller.list
  #   else
  #     puts "I don't know the '#{command}' command."
  #   end
  # end
end
