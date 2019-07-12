def full_pyramid
    puts "Salut, bienvenue dans ma super pyramide! Combien d'etages souhaites-tu?"
    print "> "
    height = gets.chomp.to_i
    puts "Voici la pyramide:"
    height.times {|n|
    print ' ' * (height - n)
    puts '#' * (2 * n + 1)
  }
end

def wtf_pyramid
    puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ? (choisis un nombre impair)"
    print "> "
    height = gets.chomp.to_i
    height_middle = height/2 + height%2
    puts "Voici la pyramide:"
    height_middle.times {|n|
        print ' ' * (height_middle - n)
        puts '#' * (2 * n + 1)
    }
    height_middle.times.reverse_each { |n|
    print ' ' * (height_middle - (n - 1))
        puts '#' * ((2 * (n - 1)) + 1)
    }


end

wtf_pyramid

