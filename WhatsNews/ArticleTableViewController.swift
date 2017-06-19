//
//  ArticleTableViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/5/22.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    
    private struct StoryBoard{
        static let title1 = "WhatsNews"
        static let title2 = "文章"
        static let title3 = "订阅"
        static let title4 = "我的"
        static let artItemCell = "Article Item"
        static let showArts = "ShowArticle"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.navigationItem.title = StoryBoard.title2
        self.tabBarController?.navigationItem.setRightBarButton(nil, animated: animated)
    }
    
    private func refreshModel() {
        news.removeAll()
        newsModel.fetchArticle{ [weak weakSelf = self] newItem in
            DispatchQueue.main.async {
                weakSelf?.news.insert(newItem, at: 0)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        refreshModel()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    var newsModel: News = News()
    
    var news: [Array<NewsItem>] = [] {
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
            weakSelf?.setEditing(false, animated: true)
        })
        return [shareAction]
    }*/
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryBoard.artItemCell, for: indexPath)
        
        // Configure the cell...
        let newsitem = news[indexPath.section][indexPath.row]
        if let newscell = cell as? ArticleTableViewCell {
            newscell.news = newsitem
        }
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        // TODO
        return true
    }*/
    
    
    
    // Override to support editing the table view.
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }*/
    
    
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
        let item = newsModel.getDetail(section: indexPath.section, row: indexPath.row)
        
        self.performSegue(withIdentifier: StoryBoard.showArts, sender: item)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == StoryBoard.showArts {
            let controller = segue.destination as! ContentViewController
            controller.news = sender as? NewsDetail
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
