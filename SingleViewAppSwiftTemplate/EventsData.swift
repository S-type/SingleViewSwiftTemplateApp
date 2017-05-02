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
    
    var name: String
    var year: Int
    var dataURL: String
    
    
    init(name: String, year: Int, dataURL: String) {
        
        self.name = name
        self.year = year
        self.dataURL = dataURL
        
        
        
    }
    
}

let events = [
    
    Event(name: "European Union founded", year: 1950, dataURL:"https://europa.eu/european-union/about-eu/history_en"),
    Event(name: "Berlin wall drops", year: 1989, dataURL: "https://en.wikipedia.org/wiki/Berlin_Blockade"),
    Event(name: "Bauhaus school of design established", year: 1919, dataURL: "https://hr.wikipedia.org/wiki/Bauhaus"),
    Event(name: "Peking Olympics", year: 2008, dataURL: "https://en.wikipedia.org/wiki/2008_Summer_Olympics"),
    Event(name: "First summer Olympics in Athens", year: 1896, dataURL: "https://en.wikipedia.org/wiki/1896_Summer_Olympics"),
    Event(name: "Reinforced concrete first used", year: 1853, dataURL: "https://en.wikipedia.org/wiki/Reinforced_concrete"),
    Event(name: "Empire State building finished", year: 1931, dataURL: "https://hr.wikipedia.org/wiki/Empire_State_Building"),
    Event(name: "Soviet Union breakdown", year: 1990, dataURL: "https://en.wikipedia.org/wiki/Dissolution_of_the_Soviet_Union"),
    Event(name: "Fallingwater Frank Lloyd Wight house built", year: 1935, dataURL: "https://en.wikipedia.org/wiki/Fallingwater"),
    Event(name: "Statue of liberty deployed", year: 1875, dataURL: "https://hr.wikipedia.org/wiki/Kip_slobode"),
    Event(name: "Eiffel tower build", year: 1887, dataURL: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
    Event(name: "Swiss born,modern architect Le Corbusier died", year: 1965, dataURL: "https://en.wikipedia.org/wiki/Le_Corbusier"),
    Event(name: "Great recession began", year: 2007, dataURL: "https://en.wikipedia.org/wiki/Great_Recession"),
    Event(name: "The Wright brothers first flight", year: 1903, dataURL: "https://en.wikipedia.org/wiki/Wright_brothers"),
    Event(name: "Internet development starts", year: 1950, dataURL: "https://en.wikipedia.org/wiki/History_of_the_Internet"),
    Event(name: "First moon landing", year: 1969, dataURL: "https://en.wikipedia.org/wiki/Moon_landing"),
    Event(name: "Roberto Benigni Oscar won" , year: 1999, dataURL: "https://en.wikipedia.org/wiki/Roberto_Benigni"),
    Event(name: "Sochi winter Olympics", year: 2014, dataURL: "https://en.wikipedia.org/wiki/2014_Winter_Olympics"),
    Event(name: "Pretty Woman movie first cinema projection", year: 1990, dataURL: "https://en.wikipedia.org/wiki/Pretty_Woman"),
    Event(name: "Laura Pausini Grammy awarded", year: 2005, dataURL: "https://en.wikipedia.org/wiki/List_of_awards_and_nominations_received_by_Laura_Pausini"),
    Event(name: "Macintosh released", year: 1984, dataURL: "https://en.wikipedia.org/wiki/Macintosh"),
    Event(name: "Frank Gehry Pritzker awarded", year: 1989, dataURL: "http://www.pritzkerprize.com/laureates/1989"),
    Event(name: "EURO introduced", year: 1999, dataURL: "https://en.wikipedia.org/wiki/Euro"),
    Event(name: "iPad unveiled", year: 2010, dataURL: "https://en.wikipedia.org/wiki/IPad_(1st_generation)"),
    Event(name: "Current tallest skyscraper open", year: 2009, dataURL: "https://en.wikipedia.org/wiki/List_of_tallest_buildings_and_structures")
]


func getRandomEventsData() -> Event {
    
    let eventSearch = GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
    
    return events[eventSearch]

}


