//
//  Constants.swift
//  OilDreamTest
//
//  Created by dave on 05/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

let OPINET_CODE = "F365181005"
let URL_BASE = "http://www.opinet.co.kr/api/"

// 전국 주유소 평균 가격(현재)
let AVG_ALL_PRICE = URL_BASE + "avgAllPrice.do"

let QUERY_OUT_JSON_AND_CODE = "?out=json&code="

let QUERY_OUT_JSON_AND_OPINET_CODE = QUERY_OUT_JSON_AND_CODE + OPINET_CODE

// 시도별 주유소 평균가격
let AVG_SIDO_PRICE = URL_BASE + "avgSidoPrice.do"
// 시군구별 주유소 평균가격(현재)
let AVG_SIGUNGU_PRICE = URL_BASE + "avgSigunPrice.do"
// 최근 7일간 전국 일일 평균가격
let AVG_RECENT_PRICE = URL_BASE + "avgRecentPrice.do"
// 최근 1주의 주간 평균 유가 (전국/시도별)
let AVG_LAST_WEEK = URL_BASE + "avgLastWeek.do"
// 지역별 최저가 주유소(TOP 10)
let LOW_TOP10 = URL_BASE + "lowTop10.do"
// 반경내 주유소
let AROUND_ALL = URL_BASE + "aroundAll.do"
// 주유소 상세정보(ID)
let DETAIL_BY_ID = URL_BASE + "detailById.do"
// 지역 코드
let AREA_CODE = URL_BASE + "areaCode.do"
// 상호로 쥬유소 검색
let SEARCH_BY_NAME = URL_BASE + "searchByName.do"

typealias AvgAllPriceResponseCompletion = (AvgAllPrice?) -> Void
