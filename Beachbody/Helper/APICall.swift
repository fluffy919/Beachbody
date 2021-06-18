//
//  APICall.swift
//  Beachbody
//
//  Created by David Selioutsky on 6/17/21.
//

import Foundation

public class APICall: NSObject {
    
    private func sendGetRequest(_ url: URL, completion: @escaping (Data?, Error?) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  error == nil else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    func getExercise(url: String, completion: @escaping (Exer?, Error?) -> Void){
        guard let url = URL(string: url)
        else { return }

        sendGetRequest(url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                guard let data = data else {
                    print("Empty response")
                    completion(nil, nil)
                    return
                }
             
                do {
                    let exercise = try JSONDecoder().decode(Exer.self, from: data)
                    completion(exercise, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
                    
            }
        }
    }
    
    func getDetail(id: Int, completion: @escaping (ExerDetail?, Error?) -> Void){
        
        guard let url = URL(string: Homework.exDetailUrl.replacingOccurrences(of: "<id>", with: String(id)))
        else { return }
        
        sendGetRequest(url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                guard let data = data else {
                    print("Empty response")
                    completion(nil, nil)
                    return
                }
             
                do {
                    let detail = try JSONDecoder().decode(ExerDetail.self, from: data)
                    completion(detail, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
                    
            }
        }
    }
    
    func getThumb(id: Int, completion: @escaping (Thumb?, Error?) -> Void){
        
        guard let url = URL(string: Homework.exThumbUrl.replacingOccurrences(of: "<id>", with: String(id)))
        else { return }
        
        sendGetRequest(url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                guard let data = data else {
                    print("Empty response")
                    completion(nil, nil)
                    return
                }
             
                do {
                    let thumb = try JSONDecoder().decode(Thumb.self, from: data)
                    completion(thumb, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
                    
            }
        }
    }
}
