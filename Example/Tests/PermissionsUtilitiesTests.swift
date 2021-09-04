//
//  PermissionsUtilitiesTests.swift
//  SimulatorPermissions_Tests
//
//  Created by User on 9/4/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
import SimulatorPermissions
@testable import SimulatorPermissions

class PermissionsUtilitiesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetDocumentsDirectory_nil_returnsDirectory() {
        // Act
        let permissionsUtilities = PermissionsUtilities()
        let directories = permissionsUtilities.getDocumentsDirectory()
        
        // Arrange
        let directoryIsEmpty = directories.isEmpty
        
        // Act
        XCTAssertFalse(directoryIsEmpty)
    }
    
    func testconstructTCCDirectory_GivenDocumentsDirectory_returnsTCCPath() {
        // Act
        let sampleDir = "/Devices/020D7691-X-X-X/data/Containers/"
        let permissionsUtilities = PermissionsUtilities()
        
        // Arrange
        let TCCDirectory = permissionsUtilities.constructTCCDirectory(directory: sampleDir)
        let correctDirectory = "/Devices/020D7691-X-X-X/data/Library/TCC/TCC.db"
        
        // Act
        XCTAssertEqual(TCCDirectory, correctDirectory)
    }
    
    func testconstructTCCDirectory_GivenNil_returnsEmptyString() {
        // Act
        let permissionsUtilities = PermissionsUtilities()
        
        // Arrange
        let TCCDirectory = permissionsUtilities.constructTCCDirectory(directory: nil)
        
        // Act
        XCTAssertEqual(TCCDirectory, "")
    }
    
    

}
