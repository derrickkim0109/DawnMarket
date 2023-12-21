//
//  AppSubDisplayClassInfoFetchModel.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

struct AppSubDisplayClassInfoFetchModel {
    let displayClassName: String
    let appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemModel]

    func toModel() -> AppSubDisplayClassInfoFetchModel {
        let list = makeAppSubDisplayClassInfoList()
        return AppSubDisplayClassInfoFetchModel(displayClassName: displayClassName, appSubDisplayClassInfoList: list)
    }

    private func makeAppSubDisplayClassInfoList() -> [AppSubDisplayClassInfoFetchItemModel] {
        var modifiedArray = appSubDisplayClassInfoList

        // 1. 첫 번째 요소에 "상품 전체" 추가
        modifiedArray.insert(
            makeDefaultValue(
                by: modifiedArray.first,
                subClassName: "상품 전체"
            ),
            at: 0
        )

        // 2. 배열 크기를 3의 배수로 맞춤
        let remainder = modifiedArray.count % 3
        if remainder != 0 {
            let emptyItemCount = 3 - remainder
            for _ in 0..<emptyItemCount {
                modifiedArray.append(
                    makeDefaultValue(
                        by: modifiedArray.first,
                        subClassName: ""
                    )
                )
            }
        }

        return modifiedArray.map {
            AppSubDisplayClassInfoFetchItemModel(
                displayClassCode: $0.displayClassCode,
                displayClassLevel: $0.displayClassLevel,
                displayClassSequence: $0.displayClassSequence,
                parentsDisplayClassSequence: $0.parentsDisplayClassSequence,
                subDisplayClassName: $0.subDisplayClassName
            )
        }
    }

    private func makeDefaultValue(
        by item: AppSubDisplayClassInfoFetchItemModel?,
        subClassName: String
    ) -> AppSubDisplayClassInfoFetchItemModel {
        return AppSubDisplayClassInfoFetchItemModel(
            displayClassCode: item?.displayClassCode ?? "",
            displayClassLevel: item?.displayClassLevel ?? "",
            displayClassSequence: 0,
            parentsDisplayClassSequence: item?.parentsDisplayClassSequence ?? 0,
            subDisplayClassName: subClassName
        )
    }
}

extension AppSubDisplayClassInfoFetchModel {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchModel(
        displayClassName: "농축수산물",
        appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemModel.completedMock]
    )
#endif
}
