class Characters {
    var healthPoints: Int
    var weapon: Weapon
    var type: String
    
    init(healthPoints: Int, weapon: Weapon, type: String) {
        self.healthPoints = healthPoints
        self.weapon = weapon
        self.type = type
    }
    
    var description: String {
        return "-- Weapon: \(weapon.rawValue) -- LifePoints: \(healthPoints)  -- Damage: \(weapon.damage)"
    }
    
    func attack(vs: Characters) {
        if self.weapon.damage > 0 && self.healthPoints > 0 && vs.healthPoints > 0 {
            vs.healthPoints -= self.weapon.damage
            if vs.healthPoints <= 0 {
                vs.healthPoints = 0
                print ("You have killed your opponent !")
            }else {
                print("Your opponent has now \(vs.healthPoints) lifePoints !")
            }
        }else{
            print("Sorry you are dead !")
        }
    }
}
