//
//  BookStoreTest.swift
//  PAM_iOSTests
//
//  Created by kmate on 07/12/2024.
//

import XCTest
@testable import PAM_iOS

final class BookStoreTest: XCTestCase {
    private var store = BookStore(initialBooks: [])
    private let book1 = Book(
        id: 0,
        title: "Harry Potter",
        author: "J.K. Rowling",
        price: 20.0
    )
    private let book2 = Book(
        id: 1,
        title: "Harry Potter 2",
        author: "J.K. Rowling",
        price: 30.0
    )
    private let book3 = Book(
        id: 2,
        title: "Harry Potter 3",
        author: "J.K. Rowling",
        price: 50.0
    )
    

    override func setUpWithError() throws {
        store = BookStore(initialBooks: [book1, book2, book3])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRemoveBookRemovesBookWithMatchingId() throws {
        //SetUp
        let expectedBooks = [book2, book3]
        
        //Actions
        store.removeBook(byId: 0)
        
        //Verification
        XCTAssertEqual(expectedBooks, store.getAllBooks())
    }
    
    func testRemoveBookReturnsTrueOnlyIfBookHasBeenRemoved() throws {
        let testCases = [
            (input: 2, expected: true),
            (input: 100, expected: false),
            (input: 0, expected: true),
            (input: -5, expected: false),
        ]
        
        for (input, expected) in testCases {
            XCTContext.runActivity(named: "Testing \(expected) is returned when removing book with id \(input)") { activity in
                let returnValue = store.removeBook(byId: input)
                XCTAssertEqual(returnValue, expected)
            }
        }
    }
}
