//
//  SearchViewModel.swift
//  SearchStore
//
//  Created by VenD on 1/4/23.
//

import Foundation

class SearchViewModel : ObservableObject {
    
    @Published var searchReasult : Bool = false
    private let search = Search()
    
    func performSearch(query: String, category: Category) {
      if let category = Search.Category(
        rawValue: 0) {
          search.performSearch(for: query, category: category, completion: { [self]success in
          if !success {
              self.searchReasult = success
//            self.showNetworkError()
          }else {
              searchReasult = success
          }
//          self.tableView.reloadData()
//          self.landscapeVC?.searchResultsReceived()
        })
        
//        tableView.reloadData()
//        searchBar.resignFirstResponder()
      }
    }
    
    
    
}
