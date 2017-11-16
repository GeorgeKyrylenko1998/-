//
//  TopNewsCell.swift
//  Игровые новости
//
//  Created by MacBookPro on 11/15/17.
//  Copyright © 2017 MacBookPro. All rights reserved.
//

import UIKit

class TopNewsCell: UITableViewCell, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    var topNews = [UIImageView]()
    var news = [NewsItem]()
    
    var contentWidth: CGFloat = 0.0
    
    func updateTop(){
        
        pageController.numberOfPages = topNews.count
        var xCoord:CGFloat = 0;
        var i = 0
        for t in topNews{
            let imageView = t
            var lable = UILabel()
            var lableLink = UILabel()
            lableLink.textColor = UIColor.white
            lable.text = self.news[i].name
            lable.numberOfLines = 0
            lable.textColor = UIColor.white
            lable.font = UIFont.boldSystemFont(ofSize: 21)
            
            
            var link = self.news[i].link
            var linkForShow = ""
            var count = 0
            for t in link!{
                if t == "/"{
                    count+=1
                    continue
                }
                if count>=2 && count<3{
                    linkForShow+=String(t)
                }
            }
            linkForShow+=" - "
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            linkForShow += dateFormatter.string(from: (self.news[i].createdAt)!)
            lableLink.text = linkForShow
            scrollView.addSubview(imageView)
            scrollView.addSubview(lable)
            scrollView.addSubview(lableLink)
            contentWidth+=self.frame.width
            
            lableLink.frame = CGRect(x: xCoord, y: self.frame.width-250, width: self.frame.width, height: 120)
            lable.frame = CGRect(x: xCoord, y: 0, width: self.frame.width, height: self.frame.height)
            imageView.frame = CGRect(x: xCoord, y: 0, width: self.frame.width, height: self.frame.height)
            
            xCoord+=self.frame.width
            
            print(self.frame.height)
            i+=1
            
            
        }
        scrollView.contentSize = CGSize(width: xCoord,height: self.frame.height)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
        updateTop()
        // Initialization code
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x/self.frame.width)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
