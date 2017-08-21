//
//  IntroViewController.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet var buttonSignIn:UIButton!
    @IBOutlet var buttonSignUp:UIButton!
    @IBOutlet var buttonSkip:UIButton!
    @IBOutlet var scrollMain:UIScrollView!
    @IBOutlet var pageControl:UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollMain.delegate = self as? UIScrollViewDelegate
        // Do any additional setup after loading the view.
       // self .setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews(){
        self.setup()
    }
    
    func setup()
    {
        self.configurePageControl()
        buttonSignIn.layer.cornerRadius=buttonSignIn.frame.size.height/2;
        buttonSignUp.layer.cornerRadius=buttonSignUp.frame.size.height/2;
        scrollMain.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        pageControl.frame=CGRect(x: 0, y: buttonSignIn.frame.origin.y-50, width: UIScreen.main.bounds.width, height: 37)

        scrollMain.contentSize=CGSize(width: UIScreen.main.bounds.width*4, height: 0)

    }
    
    func configurePageControl()
    {
        self.pageControl.numberOfPages = 4
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor(red: 133.0/255, green: 185.0/255, blue: 44.0/255, alpha: 1.0)
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
    }

public func scrollViewDidScroll(_ scrollView: UIScrollView)
{
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        NSLog(" called")

    }

    
   

    

    @IBAction func buttonSignInClicked()
    {
        
        let loginVC : LoginViewController = LoginViewController(nibName:"LoginViewController", bundle:nil)
        
        self.navigationController?.pushViewController(loginVC, animated: true)
        
    }

    @IBAction func buttonSignUpClicked()
    {
        
        let signUpVC : Signup1ViewController = Signup1ViewController(nibName:"Signup1ViewController", bundle:nil)
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
    
    
    @IBAction func buttonSkipClicked()
    {
        let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
        self.navigationController?.pushViewController(StudiosHomeVC, animated: true)

    }

}
