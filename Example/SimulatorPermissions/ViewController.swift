//
//  ViewController.swift
//  SimulatorPermissions
//
//  Created by Mathew Yaldo on 09/03/2021.
//  Copyright (c) 2021 Mathew Yaldo. All rights reserved.
//

import UIKit
import SimulatorPermissions
class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            SimulatorPermissions().grantPermissions(for: .calendar)
            SimulatorPermissions().grantPermissions(for: .addressBook)
            SimulatorPermissions().grantPermissions(for: .photos)
            SimulatorPermissions().grantPermissions(for: .homekit)
            SimulatorPermissions().grantPermissions(for: .camera)
            SimulatorPermissions().grantPermissions(for: .microphone)
            SimulatorPermissions().grantPermissions(for: .reminders)
            print("After setting permissions: ")
            SimulatorPermissions().listPermissions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

