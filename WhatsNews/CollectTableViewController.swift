//
//  CollectTableViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/19.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class CollectTableViewController: UITableViewController {
    private struct StoryBoard{
        static let newsItemCell = "Collection Item"
        static let showColl = "Show Content"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        news = (((UIApplication.shared.delegate) as? AppDelegate)?.user!.collection.collection)!
    }
    
    var news: [Array<NewsDetail>] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news[section].count
    }
    
    /*
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "收藏" , handler: { [weak weakSelf = self] (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
            print(111111)
            weakSelf?.setEditing(false, animated: true)
        })
        return [shareAction]
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.newsItemCell, for: indexPath)
        
        // Configure the cell...
        let newsitem = news[indexPath.section][indexPath.row]
        if let newscell = cell as? CollectTableViewCell {
            newscell.news = newsitem
        }
        
        return cell
    }
    
    
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
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        let item = news[indexPath.section][indexPath.row]
        
        self.performSegue(withIdentifier: StoryBoard.showColl, sender: item)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == StoryBoard.showColl {
            let controller = segue.destination as! ContentViewController
            controller.news = sender as? NewsDetail
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
