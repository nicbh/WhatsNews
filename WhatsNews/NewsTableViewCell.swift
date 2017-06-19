//
//  NewsTableViewCell.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/12.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsSource: UILabel!
    @IBOutlet weak var NewsDate: UILabel!

    var news: NewsItem? {
        didSet{
            updateUI()
        }
    }
    
    private func updateUI(){
        NewsTitle?.text = nil
        NewsImage?.image = nil
        NewsSource?.text = nil
        NewsDate?.text = nil
        if let news = self.news {
            NewsTitle?.text = news.title
            NewsDate?.text = news.date
            var source = news.name
            if let section = news.section, section.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                source += ":" + section
            }
            NewsSource?.text = source
            
            if let imageURL = news.images {
                if let imageData = NSData(contentsOf: URL(string: imageURL[0])!) {
                        if let imView = NewsImage {
                            let size = CGSize(width: imView.bounds.width, height: imView.bounds.height)
//                            print("view size")
//                            print(size)
                            if let image = UIImage(data: imageData as Data)?.resize(toSize: size, contentMode: .scaleAspectFit) {
//                                print("image")
//                                print(image.size)
                                imView.image = image
                            }
                    }
                    NewsTitle?.sizeToFit()
                }
            }
        }
    }
    

}
