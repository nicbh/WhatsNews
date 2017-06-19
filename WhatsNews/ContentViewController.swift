//
//  ContentViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/5.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UIWebViewDelegate {
    
    private struct StoryBoard {
        static let coll = "收藏"
        static let uncoll = "取消收藏"
    }
    
    let webView = UIWebView(frame: UIScreen.main.bounds)
    
    @IBAction func collect(_ sender: UIBarButtonItem) {
        if let user = ((UIApplication.shared.delegate) as! AppDelegate).user {
            if let title = self.navigationItem.rightBarButtonItem?.title, title == StoryBoard.coll {
                user.collection.append(news!)
                self.navigationItem.rightBarButtonItem?.title = StoryBoard.uncoll
            }
            else {
                user.collection.delete(news!)
                self.navigationItem.rightBarButtonItem?.title = StoryBoard.coll
            }
        }
        else {
            let alert = UIAlertController(title: "请先登录", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "好的", style: .default, handler: { action in
                switch action.style{
                case .default:
                    break
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    var news: NewsDetail? {
        didSet{
            if let newUrl = news?.url {
                if let url = URL(string: newUrl) {
                    let request = URLRequest(url: url)
                    webView.loadRequest(request)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        view.addSubview(webView)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let user = ((UIApplication.shared.delegate) as! AppDelegate).user, user.collection.contains(news!) {
            self.navigationItem.rightBarButtonItem?.title = StoryBoard.uncoll
        }
        else {
            self.navigationItem.rightBarButtonItem?.title = StoryBoard.coll
        }
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
