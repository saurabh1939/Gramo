//
//  AppDelegate.swift
//  Jam Clan
//
//  Created by Saurabh singh rathore on 24/04/17.
//  Copyright © 2017 Saurabh singh rathore. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,Menu,CLLocationManagerDelegate {
var tableData = MPMediaQuery.playlists()
    
    var hud : MBProgressHUD!

    var isOwner:Bool = false
    var locationManager = CLLocationManager()
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    let menuVC:MenuViewController = MenuViewController(nibName:"MenuViewController",bundle: nil)
 //   var musicPlayerHomeVC : UIViewController?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UserDefaults.standard.set("testData", forKey: "deviceToken")
        UserDefaults.standard.synchronize()
        
   //     musicPlayerHomeVC = MusicPlayerHomeViewController(nibName:"MusicPlayerHomeViewController", bundle:nil)

        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
//        // iOS 10 support
//        if #available(iOS 10, *) {
//            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
//            application.registerForRemoteNotifications()
//        }
//            // iOS 9 support
//        else if #available(iOS 9, *) {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
//            UIApplication.shared.registerForRemoteNotifications()
//        }
//            // iOS 8 support
//        else if #available(iOS 8, *) {
//            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
//            UIApplication.shared.registerForRemoteNotifications()
//        }
//            // iOS 7 support
//        else {
//            application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
//        }
        
        if #available(iOS 10.0, *) {
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
            // For iOS 10 data message (sent via FCM)
            
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        // Request a Device Token For APNS Push Service
        application.registerForRemoteNotifications()

        
        getLocation()
        
        let rootViewController: RootViewController = RootViewController(nibName: "RootViewController", bundle: nil)
        navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController!.isNavigationBarHidden = true
        UIApplication.shared.statusBarStyle = .lightContent
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        self.addMenu()

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func addMenu()
    {
        menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        menuVC.delegate=self as? Menu
        
        //to add this view as subView on Window
        self.window?.addSubview(menuVC.view)
        
        //to show this view in front of mainView
        self.window?.bringSubview(toFront: menuVC.view)
    }
    
    func showMenu()
    {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations:
            {
                self.menuVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }, completion: nil)
    }
    
    func hideMenu()
    {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations:
            {
                self.menuVC.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }, completion: nil)
    }
    
    func menuClicked(_ index:Int)
    {
        print(index)
        
        
        hideMenu()
        switch index {
        case 0:
            let createVC : MenuCreateViewController = MenuCreateViewController(nibName:"MenuCreateViewController", bundle:nil)
            self.navigationController?.pushViewController(createVC, animated: true)
        case 1:
            if isOwner
            {
                let myBookingVC : MyBookingViewController = MyBookingViewController(nibName:"MyBookingViewController", bundle:nil)
                self.navigationController?.pushViewController(myBookingVC, animated: true)

                    }
        else
        {
            let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
            self.navigationController?.pushViewController(StudiosHomeVC, animated: true)

        }
        case 2:
            let notificationVC : NotificationViewController = NotificationViewController(nibName:"NotificationViewController", bundle:nil)
            self.navigationController?.pushViewController(notificationVC, animated: true)
        case 3:
            let createVC : MenuCreateViewController = MenuCreateViewController(nibName:"MenuCreateViewController", bundle:nil)
            self.navigationController?.pushViewController(createVC, animated: true)
        case 4:
            if isOwner
            {
                let StudiosHomeVC : HomeStudiosViewController = HomeStudiosViewController(nibName:"HomeStudiosViewController", bundle:nil)
                self.navigationController?.pushViewController(StudiosHomeVC, animated: true)

            }
            else
            {
            let favouritesVC : FavouritesViewController = FavouritesViewController(nibName:"FavouritesViewController", bundle:nil)
            self.navigationController?.pushViewController(favouritesVC, animated: true)
            }
        case 5:
            if isOwner
            {
                let eventHomeVC : EventHomeViewController = EventHomeViewController(nibName:"EventHomeViewController", bundle:nil)
                self.navigationController?.pushViewController(eventHomeVC, animated: true)
                
            }
            else
            {
            let myBookingVC : MyBookingViewController = MyBookingViewController(nibName:"MyBookingViewController", bundle:nil)
            self.navigationController?.pushViewController(myBookingVC, animated: true)
            }
        case 6:
            if isOwner
            {
                let myBandsVC : MyBandsViewController = MyBandsViewController(nibName:"MyBandsViewController", bundle:nil)
                self.navigationController?.pushViewController(myBandsVC , animated: true)
                
            }
            else
            {
            let merchandiseVC : MerchandiseViewController = MerchandiseViewController(nibName:"MerchandiseViewController", bundle:nil)
            self.navigationController?.pushViewController(merchandiseVC , animated: true)
            }
        case 7:
            let historyVC : FundHistoryViewController = FundHistoryViewController(nibName:"FundHistoryViewController", bundle:nil)
            self.navigationController?.pushViewController(historyVC, animated: true)
        case 8:
            let settingsVC : SettingsViewController = SettingsViewController(nibName:"SettingsViewController", bundle:nil)
            self.navigationController?.pushViewController(settingsVC, animated: true)


        default:
            break
        }
        
        
        
//        let masterNavagation: UINavigationController
//        masterNavagation = tabbarMain?.selectedViewController as! UINavigationController
//        
//        self.hideMenu()
//        
//        switch index
//        {
//        case 0:
//            
//            break
//            
//        case 1:
//            
//            let saveHolidayVC:SaveHolidayViewController = SaveHolidayViewController(nibName:"SaveHolidayViewController",bundle: nil)
//            masterNavagation.pushViewController(saveHolidayVC, animated: false)
//            
//            break
//        case 2:
//            
//            let changePasswordVC:ChangePasswordViewController = ChangePasswordViewController(nibName:"ChangePasswordViewController",bundle: nil)
//            masterNavagation.pushViewController(changePasswordVC, animated: false)
//            break
//            
//        case 3:
//            let myprofileVC:LegalViewController = LegalViewController(nibName:"LegalViewController",bundle: nil)
//            masterNavagation.pushViewController(myprofileVC, animated: false)
//            
//            break
//        case 4:
//            
//            let loginVC : LoginViewController = LoginViewController(nibName:"LoginViewController",bundle: nil)
//            masterNavagation.pushViewController(loginVC, animated: false)
//            // self.navigationController?.pushViewController(loginVC, animated: false)
//            
//            break
//            
//        default:
//            break
//        }
    }
    
    
    
    func getLocation()
    {
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            if ((UIDevice.current.systemVersion as NSString).floatValue >= 8)
            {
                locationManager.requestWhenInUseAuthorization()
            }
            
            locationManager.startUpdatingLocation()
        }
        else
        {
            #if debug
                println("Location services are not enabled");
            #endif           
        }
    }
    
    
    func showAlert(Title : String)
    {
//        let alert: URBAlertView = URBAlertView(title: Title, message: Message)
//        alert.addButton(withTitle: "OK")
//        alert.setHandlerBlock { (buttonIndex, aView) in
//            aView?.hide();
//            CommonController.shared.hideHud()
//        }
//        alert.show()
        
        
        let alert = UIAlertController(title: Title,
                                      message: "",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        //vc will be the view controller on which you will present your alert as you cannot use self because this method is static.
        window?.rootViewController?.present(alert, animated: true, completion: nil)
        
        
    }

    
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    
    
       func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenChars = (deviceToken as NSData).bytes.bindMemory(to: CChar.self, capacity: deviceToken.count)
        var tokenString = ""
        
        for i in 0..<deviceToken.count {
            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        }
        
        UserDefaults.standard.set(tokenString, forKey: "deviceToken")
        UserDefaults.standard.synchronize()

        print("tokenString: \(tokenString)")
    }

    
    private func locationManager(_ manager: CLLocationManager!, didFailWithError error: NSError!)
    {
        locationManager.stopUpdatingLocation()
        if ((error) != nil)
        {
            print(error)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
         locationManager.stopUpdatingLocation()
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
        
        UserDefaults.standard.set(coord.latitude, forKey: "lat")
        UserDefaults.standard.synchronize()
        
        UserDefaults.standard.set(coord.longitude, forKey: "long")
        UserDefaults.standard.synchronize()
        
        let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        
        fetchCountryAndCity(location: location) { country, city in
            print("country:", country)
            print("city:", city)
            UserDefaults.standard.set(city, forKey: "currentCity")
            UserDefaults.standard.synchronize()
        }

    
    }
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
//    {
//        
//    }
    
    func fetchCountryAndCity(location: CLLocation, completion: @escaping (String, String) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print(error)
            } else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.locality {
                completion(country, city)
            }
        }
    }
    
    
    func showHud(title: String, sender: UIView)
    {
        if (hud != nil)
        {
            self.hideHud()
        }
        hud = MBProgressHUD.showAdded(to: sender, animated: true)
        hud.label.text = title
        //hud.bezelView.backgroundColor = UIColor.black
        //hud.contentColor = UIColor.white
    }
    func hideHud()
    {
        if (hud == nil)
        {
            return
        }
        hud.hide(animated: true)
        hud=nil
    }

    
    


}

