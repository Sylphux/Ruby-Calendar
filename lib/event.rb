class Event

    attr_accessor :date, :len, :title, :attendees
    @@events = []

    def initialize(date, len, title, attendees) #initialize name is reserved for calls with new
        @date = Time.parse(date) #Time
        @len = len.to_i #Integer
        @title = title #string
        @attendees = attendees #link to user instance
        @@events << self
    end

    def self.all
        @@events
    end

    def postpone
        @date += 60*60*24
        puts "Postponed to " + @date.to_s
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

    def self.find_by_name(name)
        for n in @@events
            if n.title == name
                return n
                break
            end
        end
    end

end