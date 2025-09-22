# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require 'time' #retourne "true"
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'

def askpostpone
    puts "Postpone ? Y/n"
    question = gets.chomp
    if question == "y" or question == ""
        return true
    else
        return false
    end
end

def perform

    #remplir les users
    puts "### USERS ####"
    julie = User.new("juliefun@gmail.com", 24)
    lord = User.new("juliefl.com", 23)
    funlord = User.new("juliefun@gl.com", 22)
    cricachoc = User.new("ulun@gmail.com", 21)
    puts User.all, "\n"
    puts "Number of users : " + User.count.to_s, "\n"

    #remplir les events
    puts "### EVENTS ###"
    first = Event.new("2025-09-22 20:00", 10, "Bouffe", [julie.email, lord.email])
    second = Event.new("2028-01-13 11:00", 20, "Dodo", [julie.email, lord.email])
    third = Event.new("2019-01-13 15:00", 30, "Metro", [julie.email, lord.email])
    puts Event.all
    puts first.giveinfo

    #postponing first to 24h
    first.postpone
    puts "\n### Event postponed ###"
    puts first.giveinfo

    #find by email
    id = User.find_by_email("juliefun@gmail.com")
    puts "User ID is : " + id.to_s
    puts "Users age is : " + id.age.to_s

end

perform