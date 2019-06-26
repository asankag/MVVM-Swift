//
//  MoviewClient.swift
//  testInterview
//
//  Created by Asanka on 6/18/19.
//  Copyright © 2019 Asanka. All rights reserved.
//

import UIKit


class CurrencyClient: NSObject {
    func fatchMovies(completion: @escaping ([NSDictionary]?)-> ()){
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: urlString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            do {
                let parsedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! NSDictionary
                if let movies = parsedData.value(forKeyPath: "feed.entry") as? [NSDictionary]{
                    completion(movies)
                    return
                }
                
            } catch let error as NSError {
                print(error)
            }
        })
        task.resume()
    }
    
    func fatchLatestCurrencies(completion: @escaping (currencyObj?)-> ()){
        let urlString = "https://api.exchangeratesapi.io/latest"
        let url = URL(string: urlString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            do {
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Parsed JSON: '\(String(describing: jsonStr))'")
                
                guard let receivedTodo = try JSONSerialization.jsonObject(with: data!,
                                                                          options: []) as? [String: Any] else {
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                
                let statusObj = receivedTodo as? NSDictionary
                
                guard let base = statusObj!["base"] as? String  else {
                    print("Could not get todoID as int from JSON")
                    return
                }
                print(base)
                guard let date = statusObj!["date"] as? String  else {
                    print("Could not get todoID as int from JSON")
                    return
                }
                print(date)
                
                guard let rates = statusObj!.value(forKeyPath: "rates") as? NSDictionary else {
                    // completion(movies)
                    return
                }
                print(rates)
 
                print(rates.count)
                var currency: currencyObj!

                currency = currencyObj.init(base: base, date: date, rates: rates)

                print(currency.base)
                completion(currency)
                
                
            } catch let error as NSError {
                print(error)
            }
        })
        task.resume()
    }
    
    func fatchCurrenciesByDate(dateTxt :String, completion: @escaping (NSDictionary)-> ()){
        let urlString = "https://api.exchangeratesapi.io/" + dateTxt
        let url = URL(string: urlString)!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil {
                completion([:])
                return
            }
            
            do {
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Parsed JSON: '\(String(describing: jsonStr))'")
                
                guard let receivedTodo = try JSONSerialization.jsonObject(with: data!,
                                                                          options: []) as? [String: Any] else {
                                                                            print("Could not get JSON from responseData as dictionary")
                                                                            return
                }
                
                let statusObj = receivedTodo as? NSDictionary
                
                guard let rates = statusObj!.value(forKeyPath: "rates") as? NSDictionary else {
                    // completion(movies)
                    return
                }
                print(rates)
                
                print(rates.count)
               
                completion(rates)
                
                
            } catch let error as NSError {
                print(error)
            }
        })
        task.resume()
    }
}

class currencyObj: NSObject{
    let base: String
    let date: String
    let rates: NSDictionary
    
    init(base: String, date: String, rates:NSDictionary){
        self.base = base
        self.date = date
        self.rates = rates
    }
}
