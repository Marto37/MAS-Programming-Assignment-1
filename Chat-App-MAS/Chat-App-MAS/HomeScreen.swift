//
//  HomeScreen.swift
//  Chat-App-MAS
//
//  Created by Marcelo Costa on 9/1/20.
//  Copyright © 2020 Malek Amiri. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goWasPressed(_ sender: Any) {
        let name = nameTextField.text
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        if let vc = vc {
            vc.name = name ?? ""
            navigationController?.pushViewController(vc, animated: true)
        }
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
