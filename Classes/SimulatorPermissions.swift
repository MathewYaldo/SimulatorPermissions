//
//  simulatorPermissions.swift
//  simulatorPermissions
//
//  Created by Mathew Yaldo on 9/3/21.
//

import Foundation
import EventKit
import Contacts
import Photos
import HomeKit
import SQLite3

public class SimulatorPermissions {
    private var databasePtr: OpaquePointer?
    private var statementPtr: OpaquePointer?
    public enum Service: Int {
        case addressBook
        case photos
        case calendar
        case homekit
        case contacts
        case camera
        case microphone
        case reminders
    }
    
    public init() {}
    
    private func initializeDatabase(dbPath: String) {
        sqlite3_open(dbPath, &databasePtr)
    }
    
    private func executeStatement(statement: String, params: [Any]) {
        guard databasePtr != nil else {
            print("[SimulatorPermissions] Error: nil database pointer")
            return
        }
        
        sqlite3_prepare_v2(databasePtr, statement, -1, &statementPtr, nil)
        var col = 1
        for param in params {
            if param is String {
                sqlite3_bind_text(statementPtr, Int32(col), String(describing: param), -1, nil)
            }
            if param is Int {
                if let value = param as? Int {
                    sqlite3_bind_int(statementPtr, Int32(col), Int32(value))
                }
            }
            col += 1
        }
        
        sqlite3_step(statementPtr)
        sqlite3_finalize(statementPtr)
    }
    
    private func getDatabaseParameterIdentifier(service: Service) -> String {
        switch service {
        case .addressBook:
           return "kTCCServiceAddressBook"
        case .photos:
           return "kTCCServicePhotos"
        case .calendar:
            return "kTCCServiceCalendar"
        case .homekit:
            return "kTCCServiceWillow"
        case .contacts:
            return "kTCCServiceContacts"
        case .camera:
            return "kTCCServiceCamera"
        case .microphone:
            return "kTCCServiceMicrophone"
        case .reminders:
            return "kTCCServiceReminders"
        }
    }
    
    private func getDatabaseAuthVersion(service: Service) -> Int {
        switch service {
        case .addressBook, .calendar, .homekit, .camera, .microphone, .reminders, .contacts:
           return 1
        case .photos:
           return 2
        }
    }
    
    public func grantPermissions(for service: Service, bundleID: String? = nil) {
        let directory = PermissionsUtilities().getDocumentsDirectory().first
        let TCC = PermissionsUtilities().constructTCCDirectory(directory: directory)
        
        guard !TCC.isEmpty else {
            print("[SimulatorPermissions] Could not get TCC path.")
            return
        }
        
        var bundle: String
        if let bundleID = bundleID {
            bundle = bundleID
        } else {
            bundle = Bundle.main.bundleIdentifier!
        }
        
        initializeDatabase(dbPath: TCC)
        let serviceID = getDatabaseParameterIdentifier(service: service)
        let authVersion = getDatabaseAuthVersion(service: service)
        if #available(iOS 14, *) {
            let replace = "REPLACE INTO access (service, client, client_type, auth_value, auth_reason, auth_version, flags)"
            let bindings = " VALUES (?, ?, ?, ? , ?, ?, ?)"
            let stmt = replace + bindings
            executeStatement(statement: stmt, params: [serviceID, bundle, 0, 2, 2, authVersion, 0])
        } else if #available(iOS 13, *) {
            let replace = "REPLACE INTO access (service, client, client_type, allowed, prompt_count)"
            let bindings = " VALUES (?, ?, ?, ?, ?)"
            let stmt = replace + bindings
            executeStatement(statement: stmt, params: [serviceID, bundle, 0, authVersion, 1])
        } else if #available(iOS 12, *) {
            let replace = "REPLACE INTO access (service, client, client_type, allowed, prompt_count)"
            let bindings = " VALUES (?, ?, ?, ?, ?)"
            let stmt = replace + bindings
            executeStatement(statement: stmt, params: [serviceID, bundle, 0, authVersion, 1])
        }
    }
    
    public func listPermissions() {
        let calendarAuthorizationStatus = EKEventStore.authorizationStatus(for: .event)
        let addressBookAuthorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        // let microphoneAuthorizationStatus = AVAudioSession.sharedInstance().recordPermission()
        let reminderAuthorizationStatus = EKEventStore.authorizationStatus(for: .reminder)
        print(addressBookAuthorizationStatus == .authorized ? "Contacts Authorized ✅" : "Contacts Unauthorized ❌")
        print(calendarAuthorizationStatus == .authorized ? "Calendar Authorized ✅" : "Calendar Unauthorized ❌")
        print(cameraAuthorizationStatus == .authorized ? "Camera Authorized ✅" : "Camera Unauthorized ❌")
        // print(microphoneAuthorizationStatus == .granted ? "Microphone Authorized ✅" : "Microphone Unauthorized ❌")
        print(reminderAuthorizationStatus == .authorized ? "Reminders Authorized ✅" : "Reminders Unauthorized ❌")
        
        if #available(iOS 13.0, *) {
            let homekitAuthorizationStatus = HMHomeManager().authorizationStatus.contains(.authorized)
            print(homekitAuthorizationStatus ? "HomeKit Authorized ✅" : "HomeKit Unauthorized ❌")
        }
        if #available(iOS 14, *) {
            let photosAuthorizationStatus = PHPhotoLibrary.authorizationStatus(for: .addOnly)
            print(photosAuthorizationStatus == .authorized ? "Photos Authorized ✅" : "Photos Unauthorized ❌")
        }
    }
}
