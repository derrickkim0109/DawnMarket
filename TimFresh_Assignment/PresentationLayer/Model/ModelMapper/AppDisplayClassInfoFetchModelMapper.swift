//
//  AppDisplayClassInfoFetchModelMapper.swift
//  TimFresh_Assignment
//
//  Created by Derrick kim on 11/18/23.
//

struct AppDisplayClassInfoFetchModelMapper {
    static func toPresentationModel(entity: AppDisplayClassInfoFetchEntity) -> AppDisplayClassInfoFetchModel {

        let appDisplayClassInfoModelList = entity.data.map {
            let imagePath = $0.displayClassImagePath.makeImageURLString()

            return AppDisplayClassInfoFetchItemModel(
                displayClassCode: $0.displayClassCode,
                displayClassImagePath: imagePath,
                displayClassName: $0.displayClassName,
                displayClassSequence: $0.displayClassSequence
            )
        }

        return AppDisplayClassInfoFetchModel(
            data: appDisplayClassInfoModelList,
            message: entity.message
        )
    }
}
