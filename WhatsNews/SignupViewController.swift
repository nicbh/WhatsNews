//
//  SignupViewController.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/5.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var pwdText: UITextField!
    @IBOutlet weak var emailText: UITextField!

    @IBAction func register(_ sender: UIButton) {
        let delegate = (UIApplication.shared.delegate) as! AppDelegate
        delegate.user = User(name: nameText!.text ?? "username")
        self.navigationController?.popToRootViewController(animated: true)
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
