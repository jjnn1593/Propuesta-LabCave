//
//  LibraryBannerTest.swift
//  Tests
//
//  Created by Serban Biometrics on 02/05/2020.
//  Copyright © 2020 Serban Biometrics. All rights reserved.
//

import Foundation
import labCaveAdMob
import XCTest
class LibraryBannerTest: XCTestCase {
    
    let banner = Factory.instance.getTypeInstance(type: TypeAdMob.Banner) as! Banner
   
      func testIsIntersticial()  {
          XCTAssert(self.banner is Banner)
      }
      
}

