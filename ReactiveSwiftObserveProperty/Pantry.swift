//
//  Pantry.swift
//  ReactiveSwiftObserveProperty
//
//  Created by Toomas Vahter on 07/04/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import Foundation
import ReactiveSwift

final class Pantry {
    let jams = MutableProperty([Jam(flavour: .apple)])
    
    func add(jam: Jam) {
        jams.value.append(jam)
    }
}


struct Jam {
    enum Flavour: String {
        case apple, orange
    }
    
    let flavour: Flavour
    
    init(flavour: Flavour) {
        self.flavour = flavour
    }
}
