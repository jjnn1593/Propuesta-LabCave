//
//  LibraryIntersticial.swift
//  Tests
//
//  Created by Serban Biometrics on 02/05/2020.
//  Copyright © 2020 Serban Biometrics. All rights reserved.
//


import Foundation
import labCaveAdMob
import XCTest
class LibraryIntersticialTest: XCTestCase {
    let intersticial = Factory.instance.getTypeInstance(type: TypeAdMob.Intersticial) as! Intersticial
   
    
    func testLoadVideo(){
        intersticial.setId(id: PropertiesLibrary.getIdIntersticial())
        intersticial.loadIntersticial()
        XCTAssertFalse(intersticial.isReady())
    }
    
    func testIsIntersticial()  {
        XCTAssertFalse(self.intersticial is Intersticial)
    }
    
    
}
