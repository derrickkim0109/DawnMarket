//
//  AppDisplayClassInfoBySubDisplayClassFetchModelMapper.swift
//  MorningMarket
//
//  Created by Derrick kim on 11/18/23.
//

struct AppDisplayClassInfoBySubDisplayClassFetchModelMapper {
    static func toPresentationModel(entity: AppDisplayClassInfoBySubDisplayClassFetchEntity) -> AppDisplayClassInfoBySubDisplayClassFetchModel {
        let appSubDisplayClassInfoList = entity.data.appSubDisplayClassInfoList

        let appSubDisplayClassInfoFetchItemModel = appSubDisplayClassInfoList.map {
            AppSubDisplayClassInfoFetchItemModel(
                displayClassCode: $0.displayClassCode,
                displayClassLevel: $0.displayClassLevel,
                displayClassSequence: $0.displayClassSequence,
                parentsDisplayClassSequence: $0.parentsDisplayClassSequence,
                subDisplayClassName: $0.subDisplayClassName.replacingOccurrences(of: "/", with: ", ")
            )
        }

        let appSubDisplayClassInfoFetchModel = AppSubDisplayClassInfoFetchModel(
            displayClassName: entity.data.displayClassName,
            appSubDisplayClassInfoList: appSubDisplayClassInfoFetchItemModel
        ).toModel()

        return AppDisplayClassInfoBySubDisplayClassFetchModel(
            data: appSubDisplayClassInfoFetchModel,
            message: entity.message
        )
    }
}
