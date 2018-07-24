//
//  PreferencesSingleton.swift
//  Swift Singleton Design Pattern
//
//  Created by Andrew Jaffee on 7/14/18.
//
/*
 
 Copyright (c) 2017-2018 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import Foundation

class UserPreferences {
    
    enum Preferences {
        
        enum UserCredentials: String {
            case passwordVisibile
            case password
            case username
        }
        
        enum AppState: String {
            case appFirstRun
            case dateLastRun
            case currentVersion
        }

    } // end enum Preferences
    
    // Create a static, constant instance of
    // the enclosing class (itself) and initialize.
    static let shared = UserPreferences()
    
    // This is the private, shared resource we're protecting.
    private let userPreferences: UserDefaults
    
    // A private initializer can only be called by
    // this class itself.
    private init() {
        
        // Get the iOS shared singleton. We're
        // wrapping it here.
        userPreferences = UserDefaults.standard

    }
    
    func setBooleanForKey(_ boolean:Bool, key:String) {
        
        if key != "" {
            userPreferences.set(boolean, forKey: key)
        }
        
    }
    
    func getBooleanForKey(_ key:String) -> Bool {
        
        if let isBooleanValue = userPreferences.value(forKey: key) as! Bool? {
            print("Key \(key) is \(isBooleanValue)")
            return true
        }
        else {
            print("Key \(key) is false")
            return false
        }
        
    }
    
    func isPasswordVisible() -> Bool {
        
        let isVisible = userPreferences.bool(forKey: Preferences.UserCredentials.passwordVisibile.rawValue)
        
        if isVisible {
            return true
        }
        else {
            return false
        }
        
    }

    func setPasswordVisibity(_ visible: Bool) {
        
        userPreferences.set(visible, forKey: Preferences.UserCredentials.passwordVisibile.rawValue)
        
    }

} // end class UserPreferences

