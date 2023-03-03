import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sr_portfolio/appFunctions.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/ProjectsGroup/model/ProjectsGroupProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/contactMe/model/contactMeProviderState.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectItemData.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectsGroup.dart';
import 'package:video_player/video_player.dart';

class RemoteAssetsProviderState extends ChangeNotifier {

  late ProjectsGroupsProviderState projectGroupsProviderState;
  late HomeCoverProviderState homeCoverProviderState;
  late AboutMeProviderState aboutMeProviderState;
  late ContactMeProviderState contactMeProviderState;

  updateLinkedModel({
    required ProjectsGroupsProviderState projectGroupsModel,
    required HomeCoverProviderState homeCoverModel,
    required AboutMeProviderState aboutMeModel,
    required ContactMeProviderState contactMeModel,
  }) {
    projectGroupsProviderState = projectGroupsModel;
    homeCoverProviderState = homeCoverModel;
    aboutMeProviderState = aboutMeModel;
    contactMeProviderState = contactMeModel;
  }

  double loadPageOpacity = 1;

  
  
  
  
  Future<void> getMediaAssetsConfig(BuildContext context) async {

    // download web app data configuration
    
    // get json data file with https request
    final httpMediaAssetsConfigPackageUrl = Uri.parse('https://stefanoromanelli.it/remoteAssets/mediaAssetsConfig.json');
    final http.Response mediaAssetsConfigPackageResponseData = await http.get(httpMediaAssetsConfigPackageUrl);
    final data = json.decode(utf8.decode(mediaAssetsConfigPackageResponseData.bodyBytes));

    // set project groups data
    projectGroupsProviderState.projectsGroups = _deserializeProjectGroups(context, data);

    // set home cover data
    _deserializeHomeCover(data);
    
    // set about me data
    _aboutMe(data);


    if(kDebugMode) {
      ScaffoldMessenger.of(context).clearSnackBars();
      AppFunctions.showScaffoldMessage("json app data retrieved and deserialized ", context);
    }
    



    // download web app data
    await _loadAndInitializeMediaData(context);
    

    
    loadPageOpacity = 0;
    notifyListeners();
  }

  List<ProjectGroup> _deserializeProjectGroups(BuildContext context, dynamic data) {
    
    List<ProjectGroup> projectGroups = [] ;


    if(kDebugMode) {
      ScaffoldMessenger.of(context).clearSnackBars();
      AppFunctions.showScaffoldMessage('starting mediaAssetsConfig.json download', context);
    }


    

    for(int i = 0; i < data["assetsData"]["projectGroups"].length; i++) {
      projectGroups.add(
        ProjectGroup.fromJson(
          data["assetsData"]["projectGroups"][i],
        )
      );
    }

    return projectGroups;
  }

  void _deserializeHomeCover(dynamic data) {
    
    homeCoverProviderState.linkedinUrl = data["assetsData"]["homeCover"]["linkedinURL"];
    homeCoverProviderState.personalEmail = data["assetsData"]["homeCover"]["personalEmail"];
    homeCoverProviderState.homeCoverUrl = data["assetsData"]["homeCover"]["coverImageUrl"];
  }

  void _aboutMe(dynamic data) {
    
    aboutMeProviderState.pictureProfileUrl = data["assetsData"]["aboutMe"]["pictureProfile"];
    aboutMeProviderState.aboutMeDescription = data["assetsData"]["aboutMe"]["aboutMeDescription"];
  }

  void _contactMe(dynamic data) {
    
    contactMeProviderState.contactMeTitle = data["assetsData"]["contactMe"]["contactMeTitle"];
    contactMeProviderState.contactMeDescription = data["assetsData"]["contactMe"]["contactMeDescription"];
  }



  Future<void> _loadAndInitializeMediaData(BuildContext context) async {
    
    if (kDebugMode) {
      ScaffoldMessenger.of(context).clearSnackBars();
      AppFunctions.showScaffoldMessage('starting media assets download', context);
    }
    

    Uri httpPackageUrl;
    http.Response responseData;


    // initilize projectGroups
    for(int i = 0; i < projectGroupsProviderState.projectsGroups.length; i++) {
      

      for(int j = 0; j < projectGroupsProviderState.projectsGroups[i].projectItemDataList.length; j++) {

        ProjectItemData item = projectGroupsProviderState.projectsGroups[i].projectItemDataList[j];


        // http request raw imagePreview
        if(item.itemType != ItemType.video) {
          httpPackageUrl = Uri.parse(item.mediaPreviewUrl);
          responseData = await http.get(httpPackageUrl);
          // set raw imagePreview
          item.imageMediaPreviewImgData = responseData.bodyBytes;

        } 


        // http request raw gameAssetImage
        httpPackageUrl = Uri.parse(item.gameAssetImageURL);
        responseData = await http.get(httpPackageUrl);
        // set raw gameAssetImageImgData
        item.gameAssetImageImgData = responseData.bodyBytes;


        // http request raw backgroundCoverImageUrl
        httpPackageUrl = Uri.parse(item.backgroundCoverImageUrl);
        responseData = await http.get(httpPackageUrl);
        // set raw backgroundCoverImageUrl
        item.backgroundCoverImgData = responseData.bodyBytes;
      }
      
    }


    // http request raw homeCoverImgData
    httpPackageUrl = Uri.parse(homeCoverProviderState.homeCoverUrl);
    responseData = await http.get(httpPackageUrl);
    // set raw homeCoverImgData
    homeCoverProviderState.homeCoverImgData = responseData.bodyBytes;
    



    // http request raw aboutMeImgData
    httpPackageUrl = Uri.parse(aboutMeProviderState.pictureProfileUrl);
    responseData = await http.get(httpPackageUrl);
    // set raw aboutMeImgData
    aboutMeProviderState.pictureProfileImgData = responseData.bodyBytes;



    if (kDebugMode) {
      ScaffoldMessenger.of(context).clearSnackBars();
      AppFunctions.showScaffoldMessage('data assets download complete', context);
    }
    
  }



  
}

