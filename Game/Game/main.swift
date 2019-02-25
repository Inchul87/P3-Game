// P3 Game

import Foundation

let game = Game(players: 2)

game.welcome()
    print("Let's start !")
game.createTeam()
    while game.teams[0].score > 0 && game.teams[1].score > 0  {
        game.fight()
    }
    if game.teams[0].score <= 0 {
        print("Congratulations \(game.teams[1].playerName) ! You have win the fight !")
    } else if game.teams[1].score <= 0 {
        print("Congratulations \(game.teams[0].playerName) ! You have defeated your opponent !")
    }
