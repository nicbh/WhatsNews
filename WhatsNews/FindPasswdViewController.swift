//
//  FindPasswdViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/5.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class FindPasswdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var emailAddr: UITextField!
    
    @IBOutlet weak var userID: UITextField!
    
    func check(_ str: String) -> Bool {
        return true
    }
    
    private func checkEmail(_ email: String) -> (Bool, String) {
        let regex = MyRegex("^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$")
        if !regex.match(input: email) {
            return (false, "")
        }
        return (true, "ididid")
    }
    
    private func checkID(_ id: String) -> Bool {
        
        return check(id)
    }
    
    private func sendEmail(userID id: String) {
        // TODO:
        print("send email to \(id)")
    }
    
    @IBAction func findPwdClick(_ sender: UIButton) {
        if let email = emailAddr.text, !email.isEmpty {
            let (pass, id) = checkEmail(email)
            if pass == true {
                sendEmail(userID: id)
                let alert = UIAlertController(title: "邮件已发送", message: "", preferredStyle: UIAlertControllerStyle.alert)
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
            else {
                let alert = UIAlertController(title: "错误的邮箱", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if let id = userID.text, !id.isEmpty {
            if checkID(id) == true {
                sendEmail(userID: id)
                let alert = UIAlertController(title: "邮件已发送", message: "", preferredStyle: UIAlertControllerStyle.alert)
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
            else {
                let alert = UIAlertController(title: "错误的用户名", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
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
