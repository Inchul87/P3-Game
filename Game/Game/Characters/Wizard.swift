class Wizard: Character {
    init(characterName: String) {
        super.init(characterName: characterName, healthPoints: 90, maxNbOfHealthPoints: 90, weapon: MagicWand(), characterType: "wizard", moveType: "Heal")
    }
    
    func heal(healing: Character) {
        if self.weapon.damage > 0 && self.healthPoints > 0 && healing.healthPoints > 0 {
            healing.healthPoints += self.weapon.damage
        } else {
            print("Sorry you wizard is already dead !")
        }
        print("Your teammate has now \(healing.healthPoints) lifePoints !")
    }
    
    override func nextMove(target: Character) {
        if target.healthPoints == target.maxNbOfHealthPoints {
            print("Sorry \(target.characterName) sont déjà au maximum !")
        } else {
            if characterName == target.characterName {
                print("\(characterName) just healed himself with his \(weapon.weaponType) for \(weapon.damage) lifePoints !")
            } else {
                print("\(characterName) just healed \(target.characterName) with \(weapon.weaponType) for \(weapon.damage) lifePoints !")
            }
            if weapon.damage + target.healthPoints > target.maxNbOfHealthPoints {
                target.healthPoints = target.maxNbOfHealthPoints
            } else {
                target.healthPoints += weapon.damage
            }
        }
    }
}
