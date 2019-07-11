# VARABLES GLOBALES

$win_set = 10 # permet de paramétrer la règle de victoire d'une partie.
$visible = true # true par défaut, pour le joueur, mais pouvant être modifiée pour masquer les étapes du jeu lors de la simulation.
$counter = 0 # initialise le compteur permettant de connaître le nombre de coups joués en un nombre défini de parties.
$dice_roll_set = nil # nil par défaut, pour le joueur, mais pouvant être modifié pour simuler les inputs du joueur.

# -----------------------------------------

# STAIRWAY GAME !

def stairway_game
    # Initialisation de la partie
    dice_roll = $dice_roll_set
    win = $win_set

    # Message d'accueil utilisateur (peut être masqué lors d'une simulation)
    puts "Bienvenu à toi dans notre super jeu de l'escalier !", "Tu dois atteindre la marche #{win}, et pour cela, avoir de la chance au lancer de dé :", "- 5 ou 6 : tu avances d'une case", "- 2, 3 ou 4 : rien ne se passe", "- 1 : tu descends d'une case", "Tu es pour l'instant en bas des marches..." if $visible==true

    # Position initiale
    user_pos = 0

    # Programme de la partie
    while user_pos != win do
        # Lancer de dé
        while dice_roll!="" do
            puts "Presse la touche entrée pour lancer le dé !"
            dice_roll=gets.chomp
        end

        # Résultat du lancer et traitements
        if dice_roll==""
            $counter+=1 # comptabilisation du lancer
            dice = rand(6)+1 # simulation du dé
            if dice == 5 || dice == 6
                dice_info = "Tu avances donc d'une marche..."
                user_pos+=1
            elsif dice == 1
                dice_info = "Tu recules donc d'une marche..."
                user_pos-=1 if user_pos > 0
            else
                dice_info = "Tu restes donc immobile..."
            end

            # Fin de tour - Message utilisateur (peut être masqué lors d'une simulation)
            user_pos==0 ? user_info="Tu es actuellement en bas des marches" : user_info="Tu es actuellement sur la marche numéro #{user_pos}"
            if user_pos !=win
                puts "Tu as fait #{dice} ! #{dice_info}", "#{user_info}" if $visible==true
                dice_roll=gets.chomp if $dice_roll_set!=""
            end
        end
    end

    # Fin de partie - Message utilisateur (peut être masqué lors d'une simulation)
    puts "VICTOIRE ! Tu as fait #{dice}, la dernière marche est donc à toi ! félicitations !" if $visible==true

    return $counter # Retourne le compteur actualisé

end

# -----------------------------------------

# SIMULATION - STATISTIQUES

=begin 
Permet de simuler un nombre défini de parties et de connaître le
nombre de lancers moyen avant la fin du jeu, en affichant ou non le détail
des parties.
=end

def average_finish_time
    $dice_roll_set="" # Simulation de l'input du joueur

    # Paramétrage du nombre de parties à simuler
    plays=0
    while !(plays > 0)
        puts "Combien de parties voulez-vous simuler ?"
        print "> "
        plays=gets.chomp.to_i
    end

    # Paramétrage des options de simulation
    show=nil
    while show!="y"&&show!="n"
        puts "Voulez-vous afficher le détail du déroulement des parties ? y/n"
        print "> "
        show=gets.chomp
    end
    show == "y" ? $visible=true : $visible=false

    # Simulation
    plays.times {stairway_game}
    # Calcul et affichage du résultat
    puts "\n > Le nombre moyen de lancers de dé pour #{plays} parties est de #{$counter/plays}"
end

# -----------------------------------------

# PERFORM

def perform
    pgm = nil
    while pgm != 1 || pgm != 2 || pgm !=0
        puts "\nEntre le numéro correspondant au programme à exécuter", "- 1 : Stairway Game !", "- 2 : Simulation et statistiques", "\n- 0 : QUITTER"
        pgm = gets.chomp.to_i
        case pgm
            when 1 then 
                stairway_game
                return pgm
            when 2 then 
                average_finish_time
                return pgm
            when 0 then return
        end
    end
end

# -----------------------------------------

# TESTS

#  stairway_game
#  average_finish_time(1000)

perform # Execution du programme