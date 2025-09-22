class User
    
    attr_accessor :email, :age
    @@users = [] #variable de classe avec @@
    @@count = 0

    def initialize(email, age) #initialize name is reserved for calls with new
        @email = email
        @age = age
        @@users << self
        @@count += 1
    end

    def email
        @email
    end

    def intro
        puts "Hey, i'm #{@email} and im #{@age} y.o."
    end

    def self.all #methode de classe, toujours appelées avec self.
        @@users
    end

    def age
        @age
    end

    def self.count 
        @@count
    end

    def self.find_by_email(email)
        for n in @@users
            if n.email == email
                return n
                break
            end
        end
    end

    private #exec juste depuis la class

end