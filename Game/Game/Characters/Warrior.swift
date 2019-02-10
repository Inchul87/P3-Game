class Warrior: Characters {
    init(name: String) {
        super.init(characterName: name, healthPoints: 100, maxHealthPoints: 100, weapon: Sword(), type: "warrior")
    }
}
