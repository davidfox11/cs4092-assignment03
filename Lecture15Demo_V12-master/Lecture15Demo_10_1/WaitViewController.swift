//
//  WaitViewController.swift
//  Lecture15Demo_10_1
//
//  Created by Cathal F. Hoare on 06/11/2019.
//  Copyright © 2019 Cathal F. Hoare. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {

    var errorCode:Int? = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(_:)), name: Notification.Name("FirebaseDemo.signedin"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginFailure(_:)), name: Notification.Name("FirebaseDemo.failedsignin"), object: nil)
    }
    
    @objc func loginSuccess(_ notification:Notification){
        performSegue(withIdentifier: "movetofirstpage", sender: self)
    }
    
    @objc func loginFailure(_ notification:Notification){
        errorCode = notification.userInfo!["error"] as? Int
        performSegue(withIdentifier: "movetologinpage", sender: self)
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
