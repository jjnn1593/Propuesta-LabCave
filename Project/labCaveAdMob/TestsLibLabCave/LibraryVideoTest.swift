//
//  LibraryVideoTest.swift
//  Tests
//
//  Created by Serban Biometrics on 01/05/2020.
//  Copyright © 2020 Serban Biometrics. All rights reserved.
//

import Foundation
import labCaveAdMob
import XCTest

class LibraryVideoTest: XCTestCase {
   
    let video = Factory.instance.getTypeInstance(type: TypeAdMob.Video) as! VideoBon
    
    
    func testLoadVideo(){
        video.setId(id: PropertiesLibrary.getIdVideo())
        video.loadVideo()
        XCTAssertFalse(video.isReady())
    }
    
    func testIsVideo(){
        XCTAssert(self.video is VideoBon)
    }
    
   
    
}


   
    
    
   
    

