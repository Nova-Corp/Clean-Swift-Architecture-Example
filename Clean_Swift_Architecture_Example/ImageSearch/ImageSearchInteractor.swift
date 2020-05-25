//
//  ImageSearchInteractor.swift
//  Clean_Swift_Architecture_Example
//
//  Created by ADMIN on 24/05/20.
//  Copyright (c) 2020 Success Resource Pte Ltd.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ImageSearchBusinessLogic
{
  func getParsedJSONKeywordList(request: ImageSearch.SearchContents.Request)
}

protocol ImageSearchDataStore
{
  var searchKeywordList: [String]? { get set }
}

class ImageSearchInteractor: ImageSearchBusinessLogic, ImageSearchDataStore
{
    var searchKeywordList: [String]?
  var presenter: ImageSearchPresentationLogic?
  var worker: ImageSearchWorker?
  
  // MARK: Do something
  
  func getParsedJSONKeywordList(request: ImageSearch.SearchContents.Request)
  {
    worker = ImageSearchWorker()
    worker?.getingSearchKeyWordListWork(url: request.searchKeywordURL, header: nil) { data in
        do {
            let searchKeyWordResponse = try JSONDecoder().decode(ImageSearch.SearchContents.Response.SearchKeyWord.self, from: data)
            self.presenter?.presentSearchKeyWordList(response: searchKeyWordResponse)
        } catch {
            print(error)
        }
    }
  }
}
