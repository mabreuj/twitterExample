//
//  ProfileViewController.swift
//  twitterExample
//
//  Created by Miguel Abreu on 1/14/17.
//  Copyright © 2017 mabreu. All rights reserved.
//

import UIKit
import TwitterKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {

        let store = Twitter.sharedInstance().sessionStore
        if let userID = store.session()?.userID{
            store.logOutUserID(userID)
        }
        self.dismiss(animated: true, completion: nil)
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
