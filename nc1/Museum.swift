//
//  Museum.swift
//  nc1
//
//  Created by kimjimin on 2022/05/03.
//

import Foundation

struct Museum {
    let name: String
    let url: String
    let loc: String
    let exhibit: Int
    let book: Bool
}

let museums = [
    Museum(
        name: "포항시립미술관",
        url: "https://poma.pohang.go.kr/poma",
        loc: "포항 북구",
        exhibit: 3,
        book: false
    ),
    Museum(
        name: "부산시립미술관",
        url: "https://art.busan.go.kr/",
        loc: "부산 해운대구",
        exhibit: 3,
        book: false
    ),
    Museum(
        name: "경남도립미술관",
        url: "https://www.gyeongnam.go.kr/gam/index.gyeong",
        loc: "창원 의창구",
        exhibit: 2,
        book: true
    ),
    Museum(
        name: "솔거미술관",
        url: "https://www.gjsam.or.kr/ko/",
        loc: "경주 경감로",
        exhibit: 4,
        book: false
    ),
    Museum(
        name: "우양미술관",
        url: "http://www.wooyangmuseum.org/html/",
        loc: "경주 보문로",
        exhibit: 2,
        book: false
    ),
    Museum(
        name: "대구미술관",
        url: "https://artmuseum.daegu.go.kr/main/index.html",
        loc: "대구 수성구",
        exhibit: 2,
        book: false
    ),
    Museum(
        name: "울산시립미술관",
        url: "https://www.ulsan.go.kr/s/uam/main.ulsan",
        loc: "울산 중구",
        exhibit: 3,
        book: true
    )
]
