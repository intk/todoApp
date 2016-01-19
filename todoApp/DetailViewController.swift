//
//  DetailViewController.swift
//  todoApp
//
//  Created by Andre Goncalves on 18/01/16.
//  Copyright (c) 2016 INTK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var notesTextField: UITextView!
    
    var toDoData:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false
        notesTextField.userInteractionEnabled = false
        
        titleTextField.text = toDoData.objectForKey("itemTitle") as? String
        notesTextField.text = toDoData.objectForKey("itemNote") as? String
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func removeItem(sender: AnyObject) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        let itemListArray:NSMutableArray = (userDefaults.objectForKey("itemList") as? NSMutableArray)!
        
        let mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray {
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(toDoData)
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
