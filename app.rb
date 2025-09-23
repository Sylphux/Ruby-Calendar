require 'bundler'
require 'time'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'
require_relative 'lib/show'

def existing_users
    julie = User.new("juliefun@gmail.com", 24)
    lord = User.new("mail1@proton.non", 23)
    funlord = User.new("juliefun@gl.com", 22)
    cricachoc = User.new("ulun@gmail.com", 21)
end

def print_registered_emails
    User.all.each do |i|
        puts "      " + i.email.to_s
    end
end

def create_event(eventlist)
    #takes info on event
    puts "Name of event : "
    event_name = gets.chomp.to_s
    puts
    puts "Date of event (yyyy-mm-dd hh:mm) :"
    event_date = gets.chomp.to_s
    puts
    puts "Duration of event :"
    event_duration = gets.chomp.to_i
    puts
    puts "Registered emails are :"
    print_registered_emails
    puts "Event mail :"
    event_mail = gets.chomp.to_s
    puts

    #create event
    Event.new(event_date, event_duration, event_name, [User.find_by_email(event_mail)])
    event_id = Event.find_by_name(event_name)
    eventlist << event_id
    puts "Event created name '#{event_name}'"
    puts "Created for user with age of #{User.find_by_email(event_mail).age}"
end

def postpone_id(name)
    id = Event.find_by_name(name)
    id.postpone
    puts "Event '#{name}' with id '#{id}' has been postponed 24:00 ahead"
end

def autofill(eventlist)
    #create admin user
    julie = User.new("admin@admin", 24)
    #create one event
    Event.new("2025-12-12 12:12", 10, "Admin event", [User.find_by_email("admin@admin"), User.find_by_email("juliefun@gmail.com")]) #adds second email to test array
    event_id = Event.find_by_name("Admin event")
    eventlist << event_id
end

def postpone_request
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
end

def add_event(eventlist)
    while true
        puts "Do you want to add an event ? (Y/n/admin)"
        ask = gets.chomp.to_s
        if ask == "admin" #quick debug way
            autofill(eventlist)
            break
        end
        if ask == "y" or ask == ""
            create_event(eventlist)
        else
            break
        end
    end
end

def create_user
    while true
        puts "Create user ? (Y/n)"
        ask = gets.chomp.to_s
        puts
        if ask == "" or ask == "y"
            puts "Choose user email :"
            create_mail = gets.chomp.to_s
            puts
            puts "What is the age of user :"
            create_age = gets.chomp.to_i
            puts
            User.new(create_mail, create_age)
        else
            break
        end
    end
end

def perform
    existing_users
    eventlist = [] #list with the adress of all events
    puts "Bienvenue dans Ruby-Calendar."
    puts
    create_user
    add_event(eventlist)
    postpone_request

    #ask for printing calendar
    puts "Print calendar ?"
    ask = gets.chomp.to_s
    if ask == "" or ask == "y"
        putcalendar(eventlist)
    end
end

perform