//
//  permissionsUtilities.swift
//  simulatorPermissions
//
//  Created by Mathew Yaldo on 9/3/21.
//

import Foundation

public class PermissionsUtilities {
    public func getDocumentsDirectory() -> [String] {
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return directory
    }
    public func constructTCCDirectory(directory: String?) -> String {
        if let directory = directory {
            let paths = directory.components(separatedBy: "/Containers/")
            return paths[0] + "/Library/TCC/TCC.db"
        } else {
            return ""
        }
    }
}
