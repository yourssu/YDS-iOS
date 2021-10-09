//
//  PagesListViewModelTests.swift
//  YDS-StorybookTests
//
//  Created by Gyuni on 2021/10/09.
//

import XCTest
@testable import YDS_Storybook

final class PagesListViewModelTests: XCTestCase {
    
    //  MARK: - SetUp
    class TestViewController: UIViewController {}
    
    var page: Page?
    var pagesSection: PagesSection?
    var model: PagesListModel?
    var viewModel: PagesListViewModel?
    
    override func setUp() {
        super.setUp()
        
        self.page = Page(title: "Test Page",
                         vc: TestViewController.self)
        
        self.pagesSection = PagesSection(title: "Test Section",
                                         pages: [page!])
        
        self.model = PagesListModel(pagesSectionsList: [pagesSection!])
        
        self.viewModel = PagesListViewModel(with: model!)
    }
    
    //  MARK: - Test
    func test_tableViewTitleForHeaderInSection() {
        let title = viewModel!.tableView(titleForHeaderInSection: 0)
        XCTAssertEqual(title, "Test Section")
    }
    
    func test_tableViewNumbersOfRowsInSection() {
        let numbersOfRowsInSection = viewModel!.tableView(numberOfRowsInSection: 0)
        XCTAssertEqual(numbersOfRowsInSection, 1)
    }

    func test_tableViewTitleForRowAt_First() {
        let indexPath = IndexPath(row: 0, section: 0)
        let title = viewModel!.tableView(titleForRowAt: indexPath)

        XCTAssertEqual(title, "Test Page")
    }
    
    func test_tableViewTitleForRowAt_Second() {
        let indexPath = IndexPath(row: 0, section: 0)
        let title = viewModel!.tableView(titleForRowAt: indexPath)

        XCTAssertEqual(title, "Test Page")
    }

}
