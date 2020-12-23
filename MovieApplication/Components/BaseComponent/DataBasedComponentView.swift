//
//  DataBasedComponentView.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit

open class DataBasedComponentView<T>: BaseView {
    
    private var data: T?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(frame: CGRect, data: T? = nil) {
        super.init(frame: frame)
        self.data = data
        loadDataIntoViews()
    }
    
    open func setData(data: T?) {
        self.data = data
        loadDataIntoViews()
    }
    
    open func getData() -> T? {
        return data
    }
    
    open func loadDataIntoViews() {}
}
