//
//  AppSubDisplayClassInfoFetchEntity.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppSubDisplayClassInfoFetchEntity {
    let displayClassName: String
    let appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemEntity]

    func makeAppSubDisplayClassInfoList() -> [AppSubDisplayClassInfoFetchItemEntity] {
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
                        subClassName: "냉동야채/특수야채/전처리야채"
                    )
                )
            }
        }

        return modifiedArray.map {
            AppSubDisplayClassInfoFetchItemEntity(
                displayClassCode: $0.displayClassCode,
                displayClassLevel: $0.displayClassLevel,
                displayClassSequence: $0.displayClassSequence,
                parentsDisplayClassSequence: $0.parentsDisplayClassSequence,
                subDisplayClassName: $0.subDisplayClassName.replacingOccurrences(of: "/", with: ", ")
            )
        }
    }

    private func makeDefaultValue(
        by item: AppSubDisplayClassInfoFetchItemEntity?,
        subClassName: String
    ) -> AppSubDisplayClassInfoFetchItemEntity {
        return AppSubDisplayClassInfoFetchItemEntity(
            displayClassCode: item?.displayClassCode ?? "",
            displayClassLevel: item?.displayClassLevel ?? "",
            displayClassSequence: item?.displayClassSequence ?? 0,
            parentsDisplayClassSequence: item?.parentsDisplayClassSequence ?? 0,
            subDisplayClassName: subClassName
        )
    }
}

extension AppSubDisplayClassInfoFetchEntity {
#if DEBUG
    static let completedMock = AppSubDisplayClassInfoFetchEntity(
        displayClassName: "농축수산물",
        appSubDisplayClassInfoList: [AppSubDisplayClassInfoFetchItemEntity.completedMock]
    )
#endif
}
