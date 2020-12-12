//
//  Themes.swift
//  concentration
//
//  Created by Chao Lin on 5/9/20.
//  Copyright © 2020 Chao Lin. All rights reserved.
//

import Foundation

struct Themes {
    var themes = [["🦇","😱","🤡","👻","🎃","🦉","🍬","🍿","🍭"],
                  ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏓","🏉"],
                  ["🐶","🦁","🐹","🐒","🐸","🐼","🐷","🐔","🐧"],
                  ["🍎","🍐","🍏","🍋","🍌","🍉","🍇","🍓","🍒"],
                  ["❤️","🧡","💛","💚","💙","💜","🖤","🤍","🤎"],
                  ["🇦🇽","🇨🇦","🇬🇪","🇬🇩","🇨🇩","🇧🇶","🇨🇻","🇯🇵","🇱🇷"]]
    
    func genRandomTheme() -> Array<String>{
        return themes[Int.random(in: 0 ... 5)]
    }
}
