//
//  EventsData.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Stipe Vucemilovic on 3/21/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit


class Event {
    
    let name: String
    let year: Int
    
    
    init(name: String, year: Int) {
        
        self.name = name
        self.year = year
        
    }
    
}

let events = [
    
    Event(name: "European Union founded", year: 1951),
    Event(name: "Berlin wall drops", year: 1989),
    Event(name: "Bauhaus school of desing established", year: 1919),
    Event(name: "Peking Olympics", year: 2008),
    Event(name: "First summer Olympics in Athens", year: 1896),
    Event(name: "Reinforced concrete first used", year: 1853),
    Event(name: "Empire state building finished", year: 1931),
    Event(name: "Soviet Union breakdown", year: 1990),
    Event(name: "Fallingwater Frank Lloyd Wight house built", year: 1935),
    Event(name: "Statue of liberty deployed", year: 1875),
    Event(name: "Eiffel tower build", year: 1887),
    Event(name: "Swiss born,modern architect Le Corbusier died", year: 1965),
    Event(name: "Great recession began", year: 2007),
    Event(name: "The Wright brothers first flight", year: 1903),
    Event(name: "Internet development starts", year: 1950),
    Event(name: "First moon landing", year: 1969),
    Event(name: "Roberto Benigni Oscar won" , year: 1999),
    Event(name: "Sochi winter Olympics", year: 2014),
    Event(name: "Pretty Woman movie first cinema projection", year: 1990),
    Event(name: "Laura Pausini Grammy awarded", year: 2005),
    Event(name: "Macintosh released", year: 1984),
    Event(name: "Frank Gehry Pritzker awarded", year: 1989),
    Event(name: "EURO introduced", year: 1999),
    Event(name: "iPad unveiled", year: 2010),
    Event(name: "Current tallest skyscraper open", year: 2009)
]


func getRandomEventsData() -> Event {
    
    let eventSearch = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
    
    return events[eventSearch]

}

