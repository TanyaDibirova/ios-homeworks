

import UIKit

struct Menu {
    
    let author: String
    let description: String
    let mage: String
    let likes: Int
    let views: Int
    
}

extension Menu {
    
    static func make() -> [Menu] {
        [
            Menu(
                author: "И.И.Шишкина и К.А.Савицкого",
                description: "Утро в сосновом лесу",
                mage: "forest",
                likes: 255,
                views: 259
            ),
            Menu(
                author: "Фёдор Решетников",
                description: "Опять двойка",
                mage: "two",
                likes: 211,
                views: 215),
            Menu(
                author: "Виктор Васнецов",
                description: "Аленушка",
                mage: "alena",
                likes: 199,
                views: 203
            ),
            Menu(
                author: "Илья Репин",
                description: "Садко",
                mage: "sadko",
                likes: 340,
                views: 345
            )
        ]
    }
}
