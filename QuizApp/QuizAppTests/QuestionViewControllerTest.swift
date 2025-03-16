//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by Pavel Palancica  on 13.03.2025.
//

import XCTest
@testable import QuizApp

class QuestionViewControllerTest: XCTestCase {
    
    func test_viewDidLoad_rendersQuestionHeaderText() {
        XCTAssertEqual(makeSUT(question: "Q1").headerLabel.text, "Q1")
    }
    
    // MARK: These 2 methods can be deleted if we make the next test_viewDidLoad_renderOptions() method pass
    
    func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
        XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
    }

    func test_viewDidLoad_withOneOption_rendersOneOption() {
        let sut = makeSUT(options: ["A1"]) // NOTE: It should pass without 'sut' variable but it doesn't
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
    }
    
    // MARK: General case (after combining previous 2 methods, and adding one more, but it didn't really work with SUT inline)
    
    func test_viewDidLoad_renderOptions() {
        // XCTAssertEqual(makeSUT(options: []).tableView.numberOfRows(inSection: 0), 0)
        // XCTAssertEqual(makeSUT(options: ["A1"]).tableView.numberOfRows(inSection: 0), 1)
        // XCTAssertEqual(makeSUT(options: ["A1", "A2"]).tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_viewDidLoad_withOneOption_rendersOneOptionText() {
        let sut = makeSUT(options: ["A1"])
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)
        
        XCTAssertEqual(cell?.textLabel?.text, "A1")
    }
    
    // MARK: Helpers
    
    func makeSUT(question: String = "", options: [String] = []) -> QuestionViewController {
        let sut = QuestionViewController(question: question, options: options)
        _ = sut.view // Loads the view
        return sut
    }
}
