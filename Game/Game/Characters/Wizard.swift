class Wizard: Characters {
    init() {
        super.init(healthPoints: 90, weapon: .magicWand, type: "wizard")
    }

    override var description: String {
        return "-- Weapon: \(weapon.rawValue) -- LifePoints: \(healthPoints)  CarePoints: \(weapon.damage)"
    }
    
    func heal(healing: Characters) {
        if self.weapon.damage > 0 && self.healthPoints > 0 && healing.healthPoints > 0 {
            healing.healthPoints += self.weapon.damage
        } else {
            print("Sorry you wizard is already dead !")
        }
        print("Your teammate has now \(healing.healthPoints) lifePoints !")
    }
}
