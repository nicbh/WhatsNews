//
//  NewsModel.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/5.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import Foundation

class News {
    private var newsModel: [Array<NewsDetail>] = []
    private let rootpath = "/Users/nicbh/Developer/WhatsNews/newsserver"
    
    func fetchNews(handle: ([NewsItem]) -> Void) {
        let sp = try? FileManager.default.contentsOfDirectory(atPath: rootpath)
        newsModel.removeAll()
        newsModel.append([])
        for file in sp! {
            if file.hasSuffix("juhe.txt") {
                let filepath = rootpath + "/" + file
                if let data = NSData(contentsOfFile: filepath) {
                    let json = (try? JSONSerialization.jsonObject(with: data as Data) as! [String: Any])!
                    let date = json["date"] as! String
                    let name = json["name"] as! String
                    let id = json["id"] as! String
                    let shareurl = json["share_url"] as! String
                    var section = json["section"] as! String!
                    if (section?.isEmpty)! {
                        section = nil
                    }
                    let images = json["images"] as! Array<Any>
                    let title = json["title"] as! String
                    let content = json["content"] as! String
                    newsModel[0].append(NewsDetail(date: date, pressName: name, newsID: id, shareURL: shareurl, section: section, images: images, title: title, content: content))
                }
            }
        }
        newsModel[0].sort { $0.date > $1.date }
        for section in newsModel {
            handle(section)
        }
    }
    
    
    func fetchArticle(handle: ([NewsItem]) -> Void) {
        let sp = try? FileManager.default.contentsOfDirectory(atPath: rootpath)
        newsModel.removeAll()
        newsModel.append([])
        for file in sp! {
            if file.hasSuffix("zh.txt") {
                let filepath = rootpath + "/" + file
                if let data = NSData(contentsOfFile: filepath) {
                    let json = (try? JSONSerialization.jsonObject(with: data as Data) as! [String: Any])!
                    let date = json["date"] as! String
                    let name = json["name"] as! String
                    let id = json["id"] as! String
                    let shareurl = json["share_url"] as! String
                    var section = json["section"] as! String!
                    if (section?.isEmpty)! {
                        section = nil
                    }
                    let images = json["images"] as! Array<Any>
                    let title = json["title"] as! String
                    let content = json["content"] as! String
                    newsModel[0].append(NewsDetail(date: date, pressName: name, newsID: id, shareURL: shareurl, section: section, images: images, title: title, content: content))
                }
            }
        }
        newsModel[0].sort { $0.date > $1.date }
        for section in newsModel {
            handle(section)
        }
    }
    
    func getDetail(section sec: Int, row: Int) -> NewsDetail {
        return newsModel[sec][row]
    }
}

class NewsItem {
    var date: String
    var name: String
    var newsID: String
    var url: String
    var section: String!
    var images: Array<String>!
    var title: String
    
    init(date: String, pressName name: String, newsID id: String, shareURL url: String, section: String?, images: Array<Any>, title: String) {
        self.date = date
        self.name = name
        self.newsID = id
        self.url = url
        self.section = section
        self.images = images as! Array<String>
        self.title = title
    }
    
    func equal(_ item: NewsItem) -> Bool {
        return item.newsID == newsID
    }
}

class NewsDetail: NewsItem{
    var content: String
    
    init(date: String, pressName name: String, newsID id: String, shareURL url: String, section: String?, images: Array<Any>, title: String, content: String) {
        self.content = content
        super.init(date: date, pressName: name, newsID: id, shareURL: url, section: section, images: images, title: title)
    }
    
    
}
