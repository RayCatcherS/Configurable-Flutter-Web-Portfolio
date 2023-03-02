import 'package:flutter/material.dart';
import 'package:sr_portfolio/appFunctions.dart';

import 'projectItemData.dart';

class ProjectGroup {

  late final String _projectGroupName;
  late final String _projectGroupDescription;
  late final List<ProjectItemData> _projectItemDataList;
  ProjectGroup(String projectGroupName, String projectGroupDescription, List<ProjectItemData> projectItemDataList) {
    _projectGroupName = projectGroupName;
    _projectGroupDescription = projectGroupDescription;
    _projectItemDataList = projectItemDataList;
  }
  ProjectGroup.fromJson(dynamic data) {
    _projectGroupName = data["projectGroupName"];
    _projectGroupDescription = data["projectGroupDescription"];
    _projectItemDataList = [];
    for(int i = 0; i < data["projectItemsData"].length; i++) {

      ItemType itemType = ItemType.Image; 
      if(data["projectItemsData"][i]["itemType"] == "ItemType.urlImage") {
        itemType = ItemType.Image;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.urlImagePlayableReference") {
        itemType = ItemType.imagePlayableReference;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.urlVideo") {
        itemType = ItemType.video;
      } else if(data["projectItemsData"][i]["itemType"] == "ItemType.youTubeVideo") {
        itemType = ItemType.youTubeVideo;
      }

      Company company = Company(
        companyName: data["projectItemsData"][i]["company"]['companyName'],
        companyURL: data["projectItemsData"][i]["company"]['companyUrl']
      );
      

      _projectItemDataList.add(
        ProjectItemData(
          imagePreviewUrl: data["projectItemsData"][i]["imagePreviewUrl"],
          imagePlayableReferenceUrl: data["projectItemsData"][i]["imagePlayableReferenceUrl"],
          callToActionText: data["projectItemsData"][i]["callToActionText"],
          callToActionUrl: data["projectItemsData"][i]["callToActionUrl"],

          title: data["projectItemsData"][i]["title"],
          description: data["projectItemsData"][i]["description"],
          gameAssetImageUrl: data["projectItemsData"][i]["gameAssetImageUrl"],
          itemType: itemType,
          professionalRoles: data["projectItemsData"][i]["professionalRoles"],
          platforms: data["projectItemsData"][i]["platforms"],
          company: company,
          backgroundCoverImageUrl: data["projectItemsData"][i]["backgroundCoverImageUrl"])
      );
    }
  }

  // getter
  List<ProjectItemData> get projectItemDataList {
    return _projectItemDataList;
  }
  String get projectGroupName {
    return _projectGroupName;
  }
  String get projectGroupDescription {
    return _projectGroupDescription;
  }

  // setters
  set projectItemDataList(List<ProjectItemData> list) {
    _projectItemDataList = list;
  }
  set projectGroupName(String s) {
    _projectGroupName = s;
  }
  set projectGroupDescription(String s) {
    _projectGroupDescription = s;
  }
}