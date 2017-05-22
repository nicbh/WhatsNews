//
//  UserTableViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/5/22.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    private struct StoryBoard{
        static let title1 = "WhatsNews"
        static let title2 = "文章"
        static let title3 = "订阅"
        static let title4 = "我的"
        static let settingTitle = "设置"
        static let settingSegue = "Setting"
    }
    
    private var settingButton: UIBarButtonItem = UIBarButtonItem()
    
    func settingButtonClicked(sender: UIBarButtonItem) {
        DispatchQueue.main.async() { [weak weakSelf = self] in
            weakSelf?.performSegue(withIdentifier: StoryBoard.settingSegue, sender: sender)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.title = StoryBoard.title4
        self.tabBarController?.navigationItem.setRightBarButton(settingButton, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButton = UIBarButtonItem.init(title: StoryBoard.settingTitle, style: .plain, target: self, action: #selector(settingButtonClicked(sender:)))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    //
    //    // MARK: - Table view data source
    //
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
