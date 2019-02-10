class Wizard: Characters {
    init(name: String) {
        super.init(characterName: name, healthPoints: 90, maxHealthPoints: 90, weapon: MagicWand(), type: "wizard")
    }
    
    func heal(character: Characters) {
        if healthPoints > 0 {
            if character.healthPoints <= 0 {
                print("Sorry your character is already dead !")
            } else if character is Wizard {
                print("Sorry you can't heal yourself !")
            } else {
                character.healthPoints += weapon.heal
                print("Your \(character.type) \(character.characterName) has now \(character.healthPoints) lifePoints !")
                if character.healthPoints >= character.maxHealthPoints {
                    print("Sorry your \(character.type) \(character.characterName) can't have more than \(maxHealthPoints) lifePoints !")
                }
            }
        } else {
            print("Sorry your wizard is already dead !")
        }
    }
}
