//
//  BrokenBookStore.swift
//  PAM_iOS
//
//  Created by kmate on 07/12/2024.
//

import Foundation

class BrokenBookStore {
    private let booksStorage: LocalBookStoreImpl

    init(userDefaults: UserDefaults = .standard) {
        self.booksStorage = LocalBookStoreImpl(userDefaults: userDefaults)
    }

    func getAllBooks() -> [Book] {
        return booksStorage.getBooks()
    }

    func addBook(_ book: Book) throws {
        var books = booksStorage.getBooks()
        if books.contains(where: { $0.id == book.id }) {
            throw NSError(domain: "BrokenBookStore", code: 1, userInfo: [NSLocalizedDescriptionKey: "A book with the same ID already exists."])
        }
        books.append(book)
        booksStorage.saveBooks(books)
    }

    func removeBook(byId bookId: Int) -> Bool {
        var books = booksStorage.getBooks()
        guard let index = books.firstIndex(where: { $0.id == bookId }) else {
            return false
        }
        books.remove(at: index)
        booksStorage.saveBooks(books)
        return true
    }

    func calculateTotalValue() -> Double {
        return booksStorage.getBooks().reduce(0.0) { $0 + $1.price }
    }

    func getBooksByAuthor(_ author: String) -> [Book] {
        return booksStorage.getBooks().filter { $0.author.caseInsensitiveCompare(author) == .orderedSame }
    }
}
