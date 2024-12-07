//
//  LocalBookStoreImpl.swift
//  PAM_iOS
//
//  Created by kmate on 07/12/2024.
//

import Foundation

class LocalBookStoreImpl {
    private let userDefaults: UserDefaults
    private let booksKey = "books_key"

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func getBooks() -> [Book] {
        guard let booksData = userDefaults.data(forKey: booksKey) else {
            return [] // Return empty list if no data exists
        }
        
        do {
            let books = try JSONDecoder().decode([Book].self, from: booksData)
            return books
        } catch {
            // Ignore decoding errors and return empty list
            return []
        }
    }

    func saveBooks(_ books: [Book]) {
        do {
            let booksString = try JSONEncoder().encode(books)
            userDefaults.set(booksString, forKey: booksKey)
        } catch {
            // Ignore encoding errors
        }
    }
}
