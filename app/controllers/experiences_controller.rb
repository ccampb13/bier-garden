class ExperiencesController
  def record(style)
    if style.consumed?
      puts "You have already tried this beer in the past!"
    else
      experience = style.experience || style.build_experience
      puts "Mark as experienced? y/n"
      command = clean_gets
      if command.start_with? 'y'
        experience.consumed = true
        puts "Congrats, you've consumed #{style.name}!"
      else
        experience.consumed = false
        puts "No better time than the present. Drink up sissy!"
      end
      style.save!
    end
  end
end
