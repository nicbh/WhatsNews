//
//  NewsTableViewCell.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/12.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    
    var news: NewsItem? {
        didSet{
            updateUI()
        }
    }
    @IBOutlet weak var ArtTitle: UILabel!
    @IBOutlet weak var ArtImage: UIImageView!
    @IBOutlet weak var ArtSource: UILabel!
    @IBOutlet weak var ArtDate: UILabel!
    
    private func updateUI(){
        ArtTitle?.text = nil
        ArtImage?.image = nil
        ArtSource?.text = nil
        ArtDate?.text = nil
        if let news = self.news {
            ArtTitle?.text = news.title
            ArtDate?.text = news.date
            var source = news.name
            if let section = news.section, section.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                source += ":" + section
            }
            ArtSource?.text = source
            
            if let imageURL = news.images {
                if let imageData = NSData(contentsOf: URL(string: imageURL[0])!) {
                    if let imView = ArtImage {
                        let size = CGSize(width: imView.bounds.width, height: imView.bounds.height)
//                        print("view size")
//                        print(size)
                        if let image = UIImage(data: imageData as Data)?.resize(toSize: size, contentMode: .scaleAspectFit) {
//                            print("image")
//                            print(image.size)
                            imView.image = image
                        }
                    }
                    ArtTitle?.sizeToFit()
                }
            }
        }
    }
}
