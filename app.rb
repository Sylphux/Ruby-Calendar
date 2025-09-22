# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
require 'time' #retourne "true"
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/show'

def create_event(eventlist)

    #takes info on event
    puts "Name of event : "
    event_name = gets.chomp.to_s
    puts "Date of event (yyyy-mm-dd hh:mm) :"
    event_date = gets.chomp.to_s
    puts "Duration of event :"
    event_duration = gets.chomp.to_i
    puts "Event mail :"
    event_mail = gets.chomp.to_s

    #create event
    Event.new(event_date, event_duration, event_name, [event_mail])
    event_id = Event.find_by_name(event_name)
    eventlist << event_id
    puts "Event created with ID : " + event_id.to_s + " and name '#{event_name}'"

end

def postpone_id(name)
    id = Event.find_by_name(name)
    id.postpone
    puts "Event '#{name}' with id '#{id}' has been postponed 24:00 ahead"
end

def perform
    eventlist = [] #list with the adress of all events
    puts "Bienvenue dans Ruby-Calendar."
    while true
        puts "Do you want to add another event ? (Y/n)"
        ask = gets.chomp.to_s
        if ask == "y" or ask == ""
            create_event(eventlist)
        else
            break
        end
    end
    #puts eventlist

    #ask if we want to postpone an event
    while true
        puts "do you want to postpone an event ? (name_of_event/NO)"
        ask = gets.chomp.to_s
        if ask != "" and ask != "n"
            postpone_id(ask)
        else
            break
        end
    end

    #ask for printing calendar
    puts "Print calendar ?"
    ask = gets.chomp.to_s
    if ask == "" or ask == "y"
        putcalendar(eventlist)
    end
end



perform