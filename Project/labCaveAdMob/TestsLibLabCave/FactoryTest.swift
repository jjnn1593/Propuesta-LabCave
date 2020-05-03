//
//  FactoryTest.swift
//  Tests
//
//  Created by Serban Biometrics on 01/05/2020.
//  Copyright © 2020 Serban Biometrics. All rights reserved.
//

import Foundation
import XCTest
import labCaveAdMob
class FactoryTest: XCTestCase {
    
    func testValidTypeLibraryBanner(){
        let banner = Factory.instance.getTypeInstance(type: TypeAdMob.Banner)
        XCTAssert(banner is Banner)
        XCTAssertFalse(banner is VideoBon)
        XCTAssertFalse(banner is Intersticial)
    }
    func testValidTypeLibraryIntersticial(){
         let intersticial = Factory.instance.getTypeInstance(type: TypeAdMob.Intersticial)
        XCTAssert(intersticial is Intersticial)
        XCTAssertFalse(intersticial is Banner)
        XCTAssertFalse(intersticial is VideoBon)
       
    }
    
    func testValidTypeLibraryVideo(){
        let video = Factory.instance.getTypeInstance(type: TypeAdMob.Video)
        XCTAssert(video is VideoBon)
        XCTAssertFalse(video is Intersticial)
        XCTAssertFalse(video is Banner)
      
    }
    
}
