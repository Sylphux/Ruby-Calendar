def putcalendar(eventlist)

    day = 1
    while day != 32
        puts "----------------------------------"
        puts "|day #{day}|"
        for n in eventlist
            if n.date.mday.to_i == day.to_i
                puts
                puts "EVENT : #{n.ev_title}"
                puts "Organizer : #{n.ev_attend}"
                puts "Time : #{n.date.hour}:#{n.date.min}"
                puts
            end
        end
        puts "----------------------------------"
        day += 1
    end

end