//
//  network.swift
//  WhatsNews
//
//  Created by nicbh on 2017/6/19.
//  Copyright © 2017年 nicbh. All rights reserved.
//

import Foundation
//import SwiftSocket

class Client {
    
    private let host = "0.0.0.0"
    private let port = 9011
//    private var client: SwiftSocket.TCPClient?
    private var sendMessage: [String:Any]?
    private var getMessage: [String:Any]?
    
    init() {
//        client = SwiftSocket.TCPClient(address: host, port: Int32(port))
    }
    deinit {
//        client?.close()
    }
    
    private func get() {
        if let message = sendMessage {
            if (!JSONSerialization.isValidJSONObject(message)) {
                print("is not a valid json object")
                return
            }
            //利用自带的json库转换成Data
            //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
            let data = try? JSONSerialization.data(withJSONObject: message, options: [])
            //Data转换成String打印输出
            let str = String(data:data!, encoding: String.Encoding.utf8)
            //输出json字符串
            print("Json Str:")
            print(str!)
        }
        
    }
    
    func getNews()->[Array<NewsDetail>] {
        sendMessage = ["message":"News"]
        get()
        if let message = getMessage, message["message"] as? String == "News", message["state"] as? Int == 1 {
            
            /*
             let rootpath = "/Users/nicbh/Developer/WhatsNews"
             let sp = try? FileManager.default.contentsOfDirectory(atPath: rootpath)
             for file in sp! {
             if file.hasSuffix(".txt") {
             let filepath = rootpath + "/" + file
             if let data = NSData(contentsOfFile: filepath) {
             let json = (try? JSONSerialization.jsonObject(with: data as Data) as! [String: Any])!
             let date = json["date"] as! String
             let name = json["name"] as! String
             let id = json["id"] as! Int
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
             }*/
            if let newslist = message["content"] as? Array<[String:Any]> {
                var result = [Array<NewsDetail>]()
                for news in newslist {
                    let date = news["date"] as! String
                    let name = news["name"] as! String
                    let id = news["id"] as! String
                    let shareurl = news["share_url"] as! String
                    var section = news["section"] as! String!
                    if (section?.isEmpty)! {
                        section = nil
                    }
                    let images = news["images"] as! Array<Any>
                    let title = news["title"] as! String
                    let content = news["content"] as! String
                    result[0].append(NewsDetail(date: date, pressName: name, newsID: id, shareURL: shareurl, section: section, images: images, title: title, content: content))
                }
                return result
            }
        }
        return []
    }
    
    func getArticle() {
        
    }
    func register() {
        
    }
    func login() {
        
    }
    func findPwd() {
        
    }
    
    func response() {
        
    }
    func collect() {
        
    }
}
