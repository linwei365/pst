//
//  ViewController.swift
//  NSURLSessionB
//
//  Created by Lin Wei on 9/12/16.
//  Copyright © 2016 Lin Wei. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var videos = [Video]()
    var channdels = [Channel]()
    let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Music Album"
        tableView.registerClass(VideoCell.self, forCellReuseIdentifier: cellID)
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
                
                self.videos = [Video]()
                
                
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let video = Video ()
                    let channelDiction = dictionary["channel"] as! [String:AnyObject]
                    
                    video.title = dictionary ["title"] as? String
                    video.thumbnailUrl = dictionary["thumbnail_image_name"] as? String
                    
                    video.channel = Channel()
                    
                    video.channel!.name = channelDiction["name"] as? String
                    video.channel!.profileImageUrl = channelDiction["profile_image_name"] as? String
                    print(video.channel!.profileImageUrl)
                    
                    
                    
                    dispatch_sync(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                    
                    self.videos .append(video)
                    
                    
                }
                
                
            }
            catch let jsonErr {
                print(jsonErr)
            }
            
            
            }.resume()
        
        
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        
        return videos.count ?? 0
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! VideoCell
        let video  = videos[indexPath.row]
        
        cell.textView.text = video.title
        cell.detailedTextView.text = video.channel?.name
        cell.videoImageView.setupImageWithUrl((video.channel?.profileImageUrl!)!)
        
        return cell
    }
    
    
}

extension UIImageView{
    
    func setupImageWithUrl(url:String)   {
        
        let imageUrl = NSURL(string: url)
        NSURLSession.sharedSession().dataTaskWithURL(imageUrl!) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.image = UIImage(data: data!)
            })
            
            
            
            
            }.resume()
        
    }
    
}

