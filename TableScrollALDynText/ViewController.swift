//
//  ViewController.swift
//  TableScrollALDynText
//
//  Created by Aaron Vegh on 2014-08-14.
//  Copyright (c) 2014 Aaron Vegh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var imageView : UIImageView!
    @IBOutlet weak private var tableView : UITableView!
    @IBOutlet weak private var containerViewHeightConstraint : NSLayoutConstraint!
    @IBOutlet weak private var tableViewHeightConstraint: NSLayoutConstraint!
    
    private var tableRows : [String] = []
                            
    override func viewDidLoad() {
        
        // Quotes are from RikerIpsum.com. LOL.
        
        self.tableRows = [
                            "Computer, belay that order. About four years. I got tired of hearing how young I looked. What? We're not at all alike! I am your worst nightmare! Mr. Worf, you do remember how to fire phasers?.",
                            "And blowing into maximum warp speed, you appeared for an instant to be in two places at once. I think you've let your personal feelings cloud your judgement. Flair is what marks the difference between artistry and mere competence. Could someone survive inside a transporter buffer for 75 years?",
                            "I recommend you don't fire until you're within 40,000 kilometers. Now we know what they mean by 'advanced' tactical training. I've had twelve years to think about it. And if I had it to do over again, I would have grabbed the phaser and pointed it at you instead of them. Shields up! Rrrrred alert!",
                            "Travel time to the nearest starbase? Well, that's certainly good to know. Congratulations - you just destroyed the Enterprise. I'll alert the crew. Wait a minute - you've been declared dead. You can't give orders around here. Worf, It's better than music. It's jazz.",
                            "The unexpected is our normal routine. Some days you get the bear, and some days the bear gets you. You bet I'm agitated! I may be surrounded by insanity, but I am not insane. Computer, lights up! The game's not big enough unless it scares you a little. Earl Grey tea, watercress sandwiches... and Bularian canapés? Are you up for promotion?",
                            "Well, that's certainly good to know. Earl Grey tea, watercress sandwiches... and Bularian canapés? Are you up for promotion? For an android with no feelings, he sure managed to evoke them in others. I think you've let your personal feelings cloud your judgement. My oath is between Captain Kargan and myself. Your only concern is with how you obey my orders. Or do you prefer the rank of prisoner to that of lieutenant? Not if I weaken first."
                            ]
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "onContentSizeChange:",
            name: UIContentSizeCategoryDidChangeNotification,
            object: nil)
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.imageView.image = UIImage(named: "riker.jpg")
        
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.layoutIfNeeded()
            
            let testSize : CGSize = CGSizeMake(self.tableView.bounds.size.width, CGFloat.max)
            let tableHeight : CGFloat = self.tableView.sizeThatFits(testSize).height
            self.tableViewHeightConstraint.constant = tableHeight
            
            self.view.layoutIfNeeded()
            
            self.containerViewHeightConstraint.constant = tableHeight + 350 // this is the fixed height of the image
            
            self.view.layoutIfNeeded()
            
            self.tableView.reloadData()
        }
        
        
        
    }
    
    private func onContentSizeChange(notification: NSNotification) {
        tableView.reloadData()
    }

    
    // MARK: - TableView datasource methods
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.tableRows.count;
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as CustomTableViewCell
        
        cell.textContentLabel.text = self.tableRows[indexPath.row];
        cell.textContentLabel.preferredMaxLayoutWidth = self.tableView.bounds.size.width - 16
        
        return cell
    }
    
    


}

