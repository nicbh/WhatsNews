//
//  CollectTableViewCell.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/19.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import UIKit

class CollectTableViewCell: UITableViewCell {

    var news: NewsItem? {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var CollTitle: UILabel!
    @IBOutlet weak var CollImage: UIImageView!
    @IBOutlet weak var CollSource: UILabel!
    @IBOutlet weak var CollDate: UILabel!
    
    private func updateUI(){
        CollTitle?.text = nil
        CollImage?.image = nil
        CollSource?.text = nil
        CollDate?.text = nil
        if let news = self.news {
            CollTitle?.text = news.title
            CollDate?.text = news.date
            var source = news.name
            if let section = news.section, section.lengthOfBytes(using: String.Encoding.utf8) > 0 {
                source += ":" + section
            }
            CollSource?.text = source
            
            if let imageURL = news.images {
                if let imageData = NSData(contentsOf: URL(string: imageURL[0])!) {
                    if let imView = CollImage {
                        let size = CGSize(width: imView.bounds.width, height: imView.bounds.height)
                        print("view size")
                        print(size)
                        if let image = UIImage(data: imageData as Data)?.resize(toSize: size, contentMode: .scaleAspectFit) {
                            print("image")
                            print(image.size)
                            imView.image = image
                        }
                    }
                    CollTitle?.sizeToFit()
                }
            }
        }
    }
}
