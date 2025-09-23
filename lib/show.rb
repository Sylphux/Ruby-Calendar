def putcalendar(eventlist)

    day = 1
    while day != 32
        puts "----------------------------------"
        puts "|day #{day}|"
        for n in eventlist
            if n.date.mday.to_i == day.to_i
                puts
                puts "##### #{n.title} #####"
                puts "Date od event : " + n.date.to_s
                puts "Event length : " + n.len.to_s
                puts "Is over : #{n.isover.to_s}"
                puts "Is soon : #{n.issoon.to_s}"
                emails_list = []
                for att in n.attendees do
                    emails_list << att.email
                end
                puts "Invited users : " + emails_list.to_s
                emails_list = []
                puts
            end
        end
        puts "----------------------------------"
        day += 1
    end

end