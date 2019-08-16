//
//  loginViewController.swift
//  codelabs
//
//  Created by dzakifa on 05/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        validate()
    }
    
    func validate() {
        do {
            let email = try emailTextView.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextView.validatedText(validationType: ValidatorType.password)
            let data = LoginData(email: email, password: password)
            save(data)
        }
        catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    func save(_ data: LoginData) {
        showAlert(for: "Login Successful!")
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailTextView: UITextField! {
        didSet {
//            emailTextView.tintColor = UIColor.lightGray
//            emailTextView.rightImage(UIImage.init(named: "email")!)
            emailTextView.paddingLeft()
            emailTextView.layer.cornerRadius = 21.5
//            emailTextView.clipsToBounds = true
            emailTextView.layer.borderWidth = 0.1
            
        }
    }
    @IBOutlet weak var passwordTextView: UITextField! {
        didSet {
//            passwordTextView.tintColor = UIColor.lightGray
//            passwordTextView.rightImage(UIImage.init(named: "pass")!)
            passwordTextView.paddingLeft()
            passwordTextView.layer.cornerRadius = 21.5
//            emailTextView.clipsToBounds = true
            passwordTextView.layer.borderWidth = 0.1
        }
    }
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        loginButton.backgroundColor = UIColor.init(red: 51/256, green: 153/256, blue: 255/256, alpha: 1)
        loginButton.layer.cornerRadius = 21.5
    }
    
    @IBAction func forgotPassButton(_ sender: Any) {
        let forgotPasswordViewController = storyboard?.instantiateViewController(withIdentifier: "forgotPasswordViewController") as! forgotPasswordViewController
        
        present(forgotPasswordViewController, animated: true, completion: nil)
    }
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyboard.instantiateViewController(withIdentifier: "LoginVC")
//    self.present(controller, animated: true, completion: nil)
//
//    // Safe Present
//    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
//    {
//        present(vc, animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "setViewedWalkthrough") {
            return
        }
        
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        if let walkthroughViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            present(walkthroughViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginFacebookButton(_ sender: Any) {
        
        
    }
    

}
