//
//  Garbo.swift
//  TwitterDemo
//
//  Created by The Soul of Fire on 5/17/17.
//  Copyright © 2017 DasCO. All rights reserved.


import UIKit
import TwitterKit

class Trio4: TWTRTimelineViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client4 = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "ONEMHS", apiClient: client4)
        
        // Do any additional setup after loading the view.
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
