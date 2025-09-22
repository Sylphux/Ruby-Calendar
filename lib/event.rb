class Event

    attr_accessor :date, :len, :title, :attendees
    @@events = []

    def initialize(date, len, title, attendees) #initialize name is reserved for calls with new
        @date = Time.parse(date) #Time
        @len = len.to_i #Integer
        @title = title #string
        @attendees = attendees #array of emails
        @@events << self
    end

    def giveinfo
        puts "Title : " + @title
        puts "Date : " + @date.to_s
        puts "Duration : " + @len.to_s
        puts "Users : " + @attendees.to_s
        puts "Endtime : " + endtime.to_s
        puts "Event is over : " + isover.to_s
        puts "Event is in less than 30 minutes : " + issoon.to_s
    end

    def date
        @date
    end

    def self.all
        @@events
    end

    def postpone
        @date += 60*60*24
    end

    def endtime
        (@date + @len  * 60).to_s
    end

    def isover
        if Time.now > @date
            return true
        else
            return false
        end
    end

    def issoon
        if isover == false and Time.now + 30*60 > @date
            return true
        else
            return false
        end
    end

end