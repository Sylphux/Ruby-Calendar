# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'

def perform
    #julie etc sont des instances de classe
    julie = User.new("juliefun@gmail.com", 24)
    julie = User.new("juliefl.com", 23)
    julie = User.new("juliefun@gl.com", 22)
    julie = User.new("ulun@gmail.com", 21)
    puts User.all
    puts User.count
end

perform