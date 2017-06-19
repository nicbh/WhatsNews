//
//  ResponseViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/17.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {
    
    private struct StoryBoard{
        static let sendTitle = "发送"
    }
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var textView: UITextView!

    private func sendResponse(contact: String?, text: String) {
        // TODO:
        print(text)
        if let cont = contact {
            print(cont)
        }
    }
    
    @IBAction func send(_ sender: UIBarButtonItem) {
        if let text = textView.text {
            sendResponse(contact: contactTextField.text, text: text)
        }
        let alert = UIAlertController(title: "谢谢您的反馈", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "好的", style: .default, handler: { [weak weakSelf = self] action in
            switch action.style{
            case .default:
                DispatchQueue.main.async() { [weak weakSelf = weakSelf] in
                    _ = weakSelf?.navigationController?.popViewController(animated: true)
                }
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the 
        self.automaticallyAdjustsScrollViewInsets = false
        textView.layer.cornerRadius = 20
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
