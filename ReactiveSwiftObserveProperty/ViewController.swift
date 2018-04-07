//
//  ViewController.swift
//  ReactiveSwiftObserveProperty
//
//  Created by Toomas Vahter on 07/04/2018.
//  Copyright © 2018 Augmented Code. All rights reserved.
//

import UIKit
import ReactiveSwift

final class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    let pantry = Pantry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SignalProducer runs the closure immediately.
        pantry.jams.producer.startWithValues { [weak self] (jams) in
            self?.textView.text = jams.map({ $0.flavour.rawValue }).joined(separator: ", ")
        }
        // Signal runs the closure only when the property changes.
        pantry.jams.signal.observeValues { (jams) in
            print("Pantry has \(jams.count) jars of jam.")
        }
        pantry.add(jam: Jam(flavour: .orange))
    }
    
    @IBAction func addJam(_ sender: Any) {
        pantry.add(jam: Jam(flavour: .apple))
    }
}

