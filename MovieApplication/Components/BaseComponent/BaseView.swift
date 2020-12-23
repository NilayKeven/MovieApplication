//
//  BaseView.swift
//  MovieApp
//
//  Created by Nilay Keven on 21.12.2020.
//

import UIKit

open class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addMajorViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        addMajorViews()
    }
    
    open func setupViews() {}
    open func addMajorViews() {}
}
