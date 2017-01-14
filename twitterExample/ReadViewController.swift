//
//  ReadViewController.swift
//  twitterExample
//
//  Created by Miguel Abreu on 1/13/17.
//  Copyright © 2017 mabreu. All rights reserved.
//

import UIKit
import TwitterKit

class ReadViewController: TWTRTimelineViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "mabreu91j", apiClient: client)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
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
