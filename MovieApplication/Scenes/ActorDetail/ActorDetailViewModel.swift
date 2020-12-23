//
//  ActorDetailViewModel.swift
//  MovieApp
//
//  Created by Nilay Keven on 23.12.2020.
//

import Foundation

class ActorDetailViewModel {
    
    var castId: Int
    
    init(castId: Int) {
        self.castId = castId
    }
    
    func getActorDetail(castId: Int, onComplete: @escaping (Actor) -> ()) {
        MovieAPI.getActorDetail(castID: castId).retrieve(completion: { [weak self] (response: Actor?) in
            guard let actor = response else { return }
            onComplete(actor)
        })
    }
}

