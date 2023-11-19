//
//  AppMainQuickMenuFetchModelMapper.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppMainQuickMenuFetchModelMapper {
    static func toPresentationModel(entity: AppMainQuickMenuFetchEntity) -> AppMainQuickMenuFetchModel {

        let appMainQuickMenuFetchModelList = entity.data.map {
            let imagePath = $0.makeImagePath()

            return AppMainQuickMenuFetchItemModel(
                quickMenuConceptScreenIdentifier: $0.quickMenuConceptScreenIdentifier,
                quickMenuConceptScreenName: $0.quickMenuConceptScreenName,
                quickMenuImagePath: imagePath,
                quickMenuMovingScreenPath: $0.quickMenuMovingScreenPath,
                quickMenuName: $0.quickMenuName,
                quickMenuSequence: $0.quickMenuSequence
            )
        }
        
        return AppMainQuickMenuFetchModel(
            data: appMainQuickMenuFetchModelList,
            message: entity.message
        )
    }
}
