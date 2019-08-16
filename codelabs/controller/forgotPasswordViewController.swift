//
//  forgotPasswordViewController.swift
//  codelabs
//
//  Created by dzakifa on 05/08/19.
//  Copyright © 2019 dzakifa. All rights reserved.
//

import UIKit

class forgotPasswordViewController: UIViewController {
    
    @IBAction func sendEmailButtonTapped(_ sender: Any) {
        validate()
    }
    
    func validate() {
        do {
            let email = try textFieldEmail.validatedText(validationType: ValidatorType.email)
            let data = ForgotPasswordData (email: email)
            save(data)
        }
        catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    func save(_ data: ForgotPasswordData) {
        showAlert(for: "Email has been send!")
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var sendEmailButton: UIButton!
    @IBOutlet weak var textFieldEmail: UITextField! {
        didSet {
            textFieldEmail.tintColor = UIColor.lightGray
            textFieldEmail.rightImage(UIImage.init(named: "email")!)
            textFieldEmail.paddingLeft()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//    sendEmailButton.backgroundColor = UIColor.init(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
    sendEmailButton.layer.cornerRadius = 7.0
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "goToForgotPassword") as? goToForgotPassword
//        self.navigationController?.pushViewController(vc!, animated: true)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
