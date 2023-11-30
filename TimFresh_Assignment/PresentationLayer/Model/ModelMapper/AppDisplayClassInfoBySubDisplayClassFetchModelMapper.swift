//
//  AppDisplayClassInfoBySubDisplayClassFetchModelMapper.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppDisplayClassInfoBySubDisplayClassFetchModelMapper {
    static func toPresentationModel(entity: AppDisplayClassInfoBySubDisplayClassFetchEntity) -> AppDisplayClassInfoBySubDisplayClassFetchModel {
        let appSubDisplayClassInfoList = entity.data.makeAppSubDisplayClassInfoList()

        let appSubDisplayClassInfoFetchItemModel = appSubDisplayClassInfoList.map {
            AppSubDisplayClassInfoFetchItemModel(
                displayClassCode: $0.displayClassCode,
                displayClassLevel: $0.displayClassLevel,
                displayClassSequence: $0.displayClassSequence,
                parentsDisplayClassSequence: $0.parentsDisplayClassSequence,
                subDisplayClassName: $0.subDisplayClassName
            )
        }

        let appSubDisplayClassInfoFetchModel = AppSubDisplayClassInfoFetchModel(
            displayClassName: entity.data.displayClassName,
            appSubDisplayClassInfoList: appSubDisplayClassInfoFetchItemModel
        )

        return AppDisplayClassInfoBySubDisplayClassFetchModel(
            data: appSubDisplayClassInfoFetchModel,
            message: entity.message
        )
    }
}
