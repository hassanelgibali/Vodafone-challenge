//
//  BaseViewController.swift
//  Challenge
//
//  Created by Hassan on 22/11/2021.
//

import UIKit
import MBProgressHUD
import SystemConfiguration


class BaseViewController: UIViewController{
    var hud: MBProgressHUD?
    
    
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func alertWith(message: String, title: String = "", completion:@escaping ()->Void)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: {(alert :UIAlertAction!) in
            completion()
        })
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    func showProgressBar()
    {
        hud = showGlobalProgressHUDWithTitle(view: self.view, title: "")
        hud?.show(animated: true)
    }
    func hideProgressBar()
    {
        hud?.hide(animated: true)
    }
    func showGlobalProgressHUDWithTitle(view:UIView!,title: String?) -> MBProgressHUD{
        
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        
        
        if title == nil{
            hud.label.text = NSLocalizedString("Loading", comment: "Loading")
        }else{
            hud.label.text = title!
        }
        return hud
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func setupNavigationBar()
    {
       
        
        self.navigationItem.setHidesBackButton(true, animated:true);
   
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
            style: UIBarButtonItem.Style.plain ,
           target: self, action:#selector(backTapped))
        backButton.tintColor = UIColor.red
            self.navigationItem.leftBarButtonItem = backButton

        let shadowView = UIView(frame: self.navigationController!.navigationBar.frame)
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.1 // your opacity
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1) // your offset
        shadowView.layer.shadowRadius =  4 //your radius
        self.view.addSubview(shadowView)

        
    }
    @objc func backTapped(button: UIButton)
    {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    
}



