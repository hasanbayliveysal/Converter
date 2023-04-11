//
//  TemperatureVC.swift
//  CurrancyApp
//
//  Created by Veysal on 10.04.23.
//

import UIKit

class TemperatureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.backgroundColor  = .black
        self.navigationItem.title = "Temperature"
        makeNumbers()
        createCancelButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
