//
//  frendStorage.swift
//  VK-Agent
//
//  Created by zeons on 11.07.2021.
//
//Мы создали класс и заполнили его статичискими данными по друзьям

import Foundation
class frendStorage{
    let frends:[frendModel]
    let findFrends:[frendModel]

    init ()
    {
        frends = [
            
        frendModel(name: "Стив Джобс", avatar: "stive", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
        frendModel(name: "Билл Шейтс", avatar: "bill", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
        frendModel(name: "Павел Дуров", avatar: "pavel", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine"))
            
            
        ]
        
        findFrends = [
            
            frendModel(name: "Стив Джобс", avatar: "stive", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Билл Шейтс", avatar: "bill", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Павел Дуров", avatar: "pavel", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Арвид Кришна", avatar: "arvid", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Рен Женфей", avatar: "ren", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Майкл Делл", avatar: "maikl", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Стив Джобс", avatar: "stive", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Билл Шейтс", avatar: "bill", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Павел Дуров", avatar: "pavel", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Арвид Кришна", avatar: "arvid", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Рен Женфей", avatar: "ren", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Майкл Делл", avatar: "maikl", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Стив Джобс", avatar: "stive", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Билл Шейтс", avatar: "bill", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Павел Дуров", avatar: "pavel", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Арвид Кришна", avatar: "arvid", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Рен Женфей", avatar: "ren", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Майкл Делл", avatar: "maikl", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Стив Джобс", avatar: "stive", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Билл Шейтс", avatar: "bill", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Павел Дуров", avatar: "pavel", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine")),
            frendModel(name: "Арвид Кришна", avatar: "arvid", frendProfile: frendProfileModel(birthday: "24-02-1955", City: "Пало-Альто", mood: "good")),
            frendModel(name: "Рен Женфей", avatar: "ren", frendProfile: frendProfileModel(birthday: "28-10-1955", City: "Сиетл", mood: "bad")),
            frendModel(name: "Майкл Делл", avatar: "maikl", frendProfile: frendProfileModel(birthday: "10-10-1984", City: "Москва", mood: "fine"))
            
            
        ]
    }
}
