//
//  BookStore.swift
//  PAM_iOS
//
//  Created by kmate on 07/12/2024.
//

import Foundation

class BookStore {
    private var books: [Book]

    init(initialBooks: [Book]) {
        self.books = initialBooks
    }

    func getAllBooks() -> [Book] {
        return books
    }

    func addBook(_ book: Book) throws {
        if books.contains(where: { $0.id == book.id }) {
            throw NSError(domain: "BookStoreError", code: 1, userInfo: [NSLocalizedDescriptionKey: "A book with the same ID already exists."])
        }
        books.append(book)
    }

    func removeBook(byId bookId: Int) -> Bool {
        if let index = books.firstIndex(where: { $0.id == bookId }) {
            books.remove(at: index)
            return true
        }
        return false
    }

    func calculateTotalValue() -> Double {
        return books.reduce(0.0) { $0 + $1.price }
    }

    func getBooksByAuthor(_ author: String) -> [Book] {
        return books.filter { $0.author.caseInsensitiveCompare(author) == .orderedSame }
    }

    func isAuthorInCollection(_ author: String) -> Bool {
        return books.contains { $0.author.caseInsensitiveCompare(author) == .orderedSame }
    }
}

struct Book: Codable, Equatable {
    let id: Int
    let title: String
    let author: String
    let price: Double
}
