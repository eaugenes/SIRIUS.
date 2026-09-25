//
//  CitySelectionController.swift
//  SIRIUS
//
//  Created by Mac-LAB on 9/10/26.
//

import Foundation
import Combine

final class CitySelectionController: ObservableObject {
    
    @Published var selectedCity: City?
    @Published var selectedCities: [City] = []
    
    let cities = CalabarzonCitiesData.cities
    
    func selectCity(_ city: City) {
        selectedCity = city
    }
    
    func toggleCity(_ city: City) {
        if selectedCities.contains(city) {
            selectedCities.removeAll(where: { $0.id == city.id })           //      $0 represents a city and $0.id = cityID from static data. The city.id is the ID of selectedCity
        } else {
            selectedCities.append(city)
        }
    }
    
    func isSelected(_ city: City) -> Bool {
        selectedCities.contains(city)
    }
    
    func clearSelection() {
        selectedCity = nil
        selectedCities.removeAll()
    }
}
