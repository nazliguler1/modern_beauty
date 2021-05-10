# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /^the landing page$/
      root_path

    when /^the Modern Beauty services list page$/
      reservation_index_path
      
   # when /^the about page$/
   #   welcome_about_path
      
    when /^the Modern Beauty landing page$/
      welcome_index_path

    when /^the RottenPotatoes edit Profile Path for "([^"]*)"$/
      edit_user_profile_path(1, 2)
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
