//
//  ViewController.swift
//  MHSSchool app v1.3
//
//  Created by The Soul of Fire on 5/13/17.
//  Copyright © 2017 DasCO. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {

    let kCellHeight:CGFloat = 110.0
    var sampleTableView:UITableView!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        
        self.sampleTableView = UITableView(frame:CGRect(x: 0,y: 160,width: self.view.frame.size.width, height: 160), style:.grouped)
        self.sampleTableView.backgroundColor=UIColor.init(colorLiteralRed: 0.23, green: 0.23, blue: 0.24, alpha: 1.0)
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
        sampleTableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.view.addSubview(sampleTableView)
        self.sampleTableView.isScrollEnabled = sampleTableView.contentSize.height > sampleTableView.frame.height;
       
        //navigationController?.navigationBar.barTintColor = UIColor.blue
       
    }
    
    override func viewDidAppear (_ animated: Bool){
    
    var nav = navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.blue
     /*   let imageView = UIImageView(frame:CGRect(x: 0, y:0, width:40, height:40))
        let image = (name: "MHS_Logo_just_M.png")
        imageView.image
        navigationItem.titleView = imageView*/
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.sampleTableView.reloadData()
        if (sampleTableView.contentSize.height < sampleTableView.frame.size.height) {
            sampleTableView.isScrollEnabled = false;
        }
        else {
            sampleTableView.isScrollEnabled = true;
        }
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let CellIdentifierPortrait = "CellPortrait";
        let CellIdentifierLandscape = "CellLandscape";
        let indentifier = self.view.frame.width > self.view.frame.height ? CellIdentifierLandscape : CellIdentifierPortrait
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: indentifier)
            cell?.selectionStyle = .none
            let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: kCellHeight))
            
            
            
            //for iPhone 5s and lower versions in portrait
            horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            //for iPhone 4s and lower versions in landscape
            horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            // for iPhone 6 plus and 6s plus in portrait
            horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            // for iPhone 6 plus and 6s plus in landscape
            horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 10, miniAppearWidthOfLastItem: 30)
            //for all other screen sizes that doesn't set here, it would use defaultMarginSettings instead
            horizontalScrollView.defaultMarginSettings = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 10, miniAppearWidthOfLastItem: 20)
            if indexPath.row == 0 {
                horizontalScrollView.uniformItemSize = CGSize(width: 100, height: 100)
                //this must be called after changing any size or margin property of this class to get acurrate margin
                horizontalScrollView.setItemsMarginOnce()
                //for _ in 1...6{
                let button1 = UIButton(frame: CGRect.zero)
                button1.setImage(UIImage(named: "bell.png"), for: UIControlState.normal)
                button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
                horizontalScrollView.addItem(button1)
                
                let button2 = UIButton(frame: CGRect.zero)
                button2.setImage(UIImage(named: "calendar.png"), for: UIControlState.normal)
                button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
                horizontalScrollView.addItem(button2)
                
                let button3 = UIButton(frame: CGRect.zero)
                button3.setImage(UIImage(named: "faculty.png"), for: UIControlState.normal)
                button3.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
                horizontalScrollView.addItem(button3)
                
                let button4 = UIButton(frame: CGRect.zero)
                button4.setImage(UIImage(named: "engrade.png"), for: UIControlState.normal)
                button4.addTarget(self, action: #selector(button4Action), for: .touchUpInside)
                horizontalScrollView.addItem(button4)
                
                let button5 = UIButton(frame: CGRect.zero)
                button5.setImage(UIImage(named: "clubs.png"), for: UIControlState.normal)
                button5.addTarget(self, action: #selector(button5Action), for: .touchUpInside)
                horizontalScrollView.addItem(button5)
                
               /* let button6 = UIButton(frame: CGRect.zero)
                button6.setImage(UIImage(named: "sponsors.png"), for: UIControlState.normal)
                button6.addTarget(self, action: #selector(button6Action), for: .touchUpInside)
                horizontalScrollView.addItem(button6)*/
        
        let button7 = UIButton(frame: CGRect.zero)
        button7.setImage(UIImage(named: "sports.png"), for: UIControlState.normal)
        button7.addTarget(self, action: #selector(button7Action), for: .touchUpInside)
        horizontalScrollView.addItem(button7)
            }
            
    
            cell?.contentView.addSubview(horizontalScrollView)
            horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: kCellHeight))
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: cell!.contentView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0))
        }
        else if let horizontalScrollView = cell?.contentView.subviews.first(where: { (view) -> Bool in
            return view is ASHorizontalScrollView
        }) as? ASHorizontalScrollView {
            horizontalScrollView.refreshSubView() //refresh view incase orientation changes
        }
        return cell!
    }
    
    
     func tableView(_ sampletableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    
    func button1Action(sender: UIButton!) {
        //bell schedule
        performSegue(withIdentifier: "segue2", sender: self)
    }
    
    func button2Action(sender: UIButton!) {
        //calendar
        performSegue(withIdentifier: "segue6", sender: self)
    }
    
    func button3Action(sender: UIButton!) {
        //faculty contact
        performSegue(withIdentifier: "segue4", sender: self)
    }
    
    func button4Action(sender: UIButton!) {
        //engrade
        performSegue(withIdentifier: "segue1", sender: self)
    }
    
    func button5Action(sender: UIButton!) {
        //clubs
        performSegue(withIdentifier: "segue5", sender: self)
    }
    
   /* func button6Action(sender: UIButton!) {
        //sponsors
        performSegue(withIdentifier: "segue7", sender: self)
    }*/
    
  func button7Action(sender: UIButton!) {
        //sports
        performSegue(withIdentifier: "segue3", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return kCellHeight
    }
    


    @IBAction func action1(_ sender: Any) {
        //2017
        performSegue(withIdentifier: "segue7", sender: self)
        
    }
  
  

    @IBAction func action2(_ sender: Any) {
        //2018
        performSegue(withIdentifier: "segue8", sender: self)
    }
    
    
    @IBAction func action3(_ sender: Any) {
        //2019
        performSegue(withIdentifier: "segue9", sender: self)
    }
    
    
    @IBAction func action4(_ sender: Any) {
        //ONEMHS
        performSegue(withIdentifier: "segue10", sender: self)
    }


    
}


