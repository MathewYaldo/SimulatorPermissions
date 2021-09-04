import XCTest
import SimulatorPermissions
import AVFoundation

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGrantCamera_CheckPermission_ReturnsAuthorized() {
        // Act
        let simulatorPermissions = SimulatorPermissions()
        simulatorPermissions.grantPermissions(for: .contacts)
        
        // Arrange
        let hasCameraPermission = AVCaptureDevice.authorizationStatus(for: .video)
        
        // Assert
        XCTAssertTrue(hasCameraPermission == .authorized)
    }
    
}
