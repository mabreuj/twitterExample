//
//  FollowersViewController.swift
//  twitterExample
//
//  Created by Miguel Abreu on 1/14/17.
//  Copyright © 2017 mabreu. All rights reserved.
//

import UIKit
import TwitterKit

class FollowersViewController: UIViewController, UITableViewDataSource {

    var followers: [TwitterFollower] = [TwitterFollower]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadFollowers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFollowers()
    {
        // Create and set Twitter client to access the Restful API
        
        let client = TWTRAPIClient(userID:Twitter.sharedInstance().sessionStore.session()?.userID)
        let followersEndpoint = "https://api.twitter.com/1.1/followers/list.json"
        var clientError : NSError?
        let request = client.urlRequest(withMethod: "GET", url: followersEndpoint, parameters: Dictionary(), error: &clientError)
        
        // Send request
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            // Succesfull request
            do {
                // Deserealize request
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                var jsonDictionary = json as! Dictionary<String,Any>
                var tempUsers = [TwitterFollower]()
                
                // Create TwitterFollowers objects
                for userDictionary in jsonDictionary["users"] as! [[String:Any]]
                {
                    let user = TwitterFollower(dictionary:userDictionary)
                    tempUsers.append(user)
                }
                
                self.followers = tempUsers
                self.tableView.reloadData()
                
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followers.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating the follower cells, using only the names for simplicity
        let user = self.followers[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = user.userName
        
        return cell
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
