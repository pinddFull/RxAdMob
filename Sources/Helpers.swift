//
//  Rx+Extension.swift
//  RxAdMob
//
//  Created by pinddddd on 05/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import Foundation

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif


extension ObservableType {
    internal func unwrap<T>() -> Observable<T> where E == T? {
        return self.filter { $0 != nil }.map { $0! }
    }
}
