import Foundation
    
enum Weapon: String, CaseIterable{
    case sword
    case magicWand
    case hammer
    case axe
    case potion
    case mace
   
    var damage: Int {
        switch self {
        case .sword: return 10
        case .magicWand: return 20
        case .hammer: return 5
        case .axe: return 30
        case .potion: return 40
        case .mace: return 40
        }
    }
    static var magicWeapon: [Weapon] = [.potion, .mace]
}
