//
//  MainNavigationViewController.swift
//  Multi Inteligencia Coletiva
//
//  Created by Lucas Rocha on 21/09/17.
//  Copyright © 2017 Lucas Tavares. All rights reserved.
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = Colors.MAIN
        navigationBar.tintColor = Colors.HIGHLIGHT_TEXT
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: Colors.HIGHLIGHT_TEXT]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
