//
//  ViewController.swift
//  MapLauncher
//
//  Created by Dmitriy Romanov on 04/02/2020.
//  Copyright (c) 2020 Dmitriy Romanov. All rights reserved.
//

import UIKit
import CoreLocation
import MapLauncher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func routeAction() {

        // Desired destination coordinates
        let placeLocation = CLLocationCoordinate2D(latitude: 50.4536, longitude: 30.5164)

        // Presenting navigation apps ActionSheet
        MapLauncher().present(destination: placeLocation, on: self)
    }

}

