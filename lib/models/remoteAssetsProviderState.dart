import 'dart:convert';

import 'package:GameDevPortfolio/appFunctions.dart';
import 'package:GameDevPortfolio/pages/firstLoadPage/loadingStringEffect/model/loadingStringEffectProviderState.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/ProjectsGroup/model/ProjectsGroupProviderState.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/aboutMe/model/aboutMeProviderState.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/contactMe/model/contactMeProviderState.dart';
import 'package:GameDevPortfolio/pages/homePage/homePageComponents/homeCover/homeCoverProviderState.dart';
import 'package:GameDevPortfolio/pages/projectsItem/data/projectItemData.dart';
import 'package:GameDevPortfolio/pages/projectsItem/data/projectsGroup.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class RemoteAssetsProviderState extends ChangeNotifier {

  late ProjectsGroupsProviderState projectGroupsProviderState;
  late HomeCoverProviderState homeCoverProviderState;
  late AboutMeProviderState aboutMeProviderState;
  late ContactMeProviderState contactMeProviderState;
  late LoadingStringEffectProviderState loadingStringEffectProviderState;

  updateLinkedModel({
    required ProjectsGroupsProviderState projectGroupsModel,
    required HomeCoverProviderState homeCoverModel,
    required AboutMeProviderState aboutMeModel,
    required ContactMeProviderState contactMeModel,
    required LoadingStringEffectProviderState loadingStringEffectModel,
  }) {
    projectGroupsProviderState = projectGroupsModel;
    homeCoverProviderState = homeCoverModel;
    aboutMeProviderState = aboutMeModel;
    contactMeProviderState = contactMeModel;
    loadingStringEffectProviderState = loadingStringEffectModel;
  }

  double loadPageOpacity = 1;


  final int _loadBarTotalUnits = 10;
  int totalItemToLoad = 0;
  double totalLoadedUnit = 0; 
  
  String _loadCharacterUnit = "█";
  String _processStatusTitle = "process status";
  String stringLoadState = "process status";
  
  
  
  Future<void> getMediaAssetsConfig(BuildContext context) async {

    // download web app data configuration
    // get file configuration json from the current web host
    final httpMediaAssetsConfigPackageUrl;
    if (kDebugMode) {
      httpMediaAssetsConfigPackageUrl = Uri.parse('https://stefanoromanelli.it/remoteAssets/mediaAssetsConfig.json');
    } else {
      httpMediaAssetsConfigPackageUrl = Uri.parse('${Uri.base.scheme}://${Uri.base.authority}/remoteAssets/mediaAssetsConfig.json');
    }
    
     
    final http.Response mediaAssetsConfigPackageResponseData = await http.get(httpMediaAssetsConfigPackageUrl);
    final data = json.decode(utf8.decode(mediaAssetsConfigPackageResponseData.bodyBytes));

    // set project groups data
    projectGroupsProviderState.projectsGroups = _deserializeProjectGroups(context, data);

    // set home cover data
    _deserializeHomeCover(data);
    
    // set about me data
    _deserializeAboutMe(data);

    // set Contact Me data
    _deserializeContactMe(data);

    // set Owner Info data
    _deserializeOwnerInfo(data);

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

    homeCoverProviderState.coverDescription1 = data["assetsData"]["homeCover"]["coverDescription1"];
    homeCoverProviderState.coverDescription2 = data["assetsData"]["homeCover"]["coverDescription2"];
  }
  void _deserializeOwnerInfo(dynamic data) {
    homeCoverProviderState.portfolioOwnerName = data["assetsData"]["portfolioOwner"];
    homeCoverProviderState.portfolioOwnerRole = data["assetsData"]["role"];
  }
  void _deserializeAboutMe(dynamic data) {
    
    aboutMeProviderState.pictureProfileUrl = data["assetsData"]["aboutMe"]["pictureProfile"];
    aboutMeProviderState.aboutMeDescription = data["assetsData"]["aboutMe"]["aboutMeDescription"];
    aboutMeProviderState.title = data["assetsData"]["aboutMe"]["title"];
  }
  void _deserializeContactMe(dynamic data) {
    
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


    // init load bar values
    for(int i = 0; i < projectGroupsProviderState.projectsGroups.length; i++) {
      for(int j = 0; j < projectGroupsProviderState.projectsGroups[i].projectItemDataList.length; j++) {
        totalItemToLoad = totalItemToLoad + 1;
        totalItemToLoad = totalItemToLoad + 1;
        totalItemToLoad = totalItemToLoad + 1;
      }
    }
    totalItemToLoad = totalItemToLoad + 2;



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

        } else if(item.itemType == ItemType.video) { // initialize videoPreview

          item.videoMediaPreviewController = VideoPlayerController.network(
            item.mediaPreviewUrl,
            videoPlayerOptions: VideoPlayerOptions(
              mixWithOthers: false              
            )
          );
          await item.videoMediaPreviewController.initialize();

          item.videoMediaPreviewController.setVolume(0);
          item.videoMediaPreviewController.setLooping(true);
          //item.videoMediaPreviewController.play();
        } else if(item.itemType == ItemType.youTubeVideo) {
          item.yTcontroller = YoutubePlayerController.fromVideoId(
            videoId: 'cEx8YRziQ1w',
          );
          // ignore: invalid_use_of_internal_member
          item.yTcontroller.init();
          item.yTcontroller.mute();
        }
        addLoadingStringBar();

        // http request raw gameAssetImage
        httpPackageUrl = Uri.parse(item.gameAssetImageURL);
        responseData = await http.get(httpPackageUrl);
        // set raw gameAssetImageImgData
        item.gameAssetImageImgData = responseData.bodyBytes;
        addLoadingStringBar();

        // http request raw backgroundCoverImageUrl
        httpPackageUrl = Uri.parse(item.backgroundCoverImageUrl);
        responseData = await http.get(httpPackageUrl);
        // set raw backgroundCoverImageUrl
        item.backgroundCoverImgData = responseData.bodyBytes;
        addLoadingStringBar();
      }
      
    }


    // http request raw homeCoverImgData
    httpPackageUrl = Uri.parse(homeCoverProviderState.homeCoverUrl);
    responseData = await http.get(httpPackageUrl);
    // set raw homeCoverImgData
    homeCoverProviderState.homeCoverImgData = responseData.bodyBytes;
    addLoadingStringBar();


    // http request raw aboutMeImgData
    httpPackageUrl = Uri.parse(aboutMeProviderState.pictureProfileUrl);
    responseData = await http.get(httpPackageUrl);
    // set raw aboutMeImgData
    aboutMeProviderState.pictureProfileImgData = responseData.bodyBytes;
    addLoadingStringBar();
    



    if (kDebugMode) {
      ScaffoldMessenger.of(context).clearSnackBars();
      AppFunctions.showScaffoldMessage('data assets download complete (${stringLoadState.length} items loaded)', context);
    }
    
  }

  void addLoadingStringBar() {
    totalLoadedUnit = totalLoadedUnit + (_loadBarTotalUnits/totalItemToLoad);

    stringLoadState = _processStatusTitle + " ";
    for(int i = 0; i < totalLoadedUnit; i++) {
      stringLoadState = stringLoadState + _loadCharacterUnit;
    }
    notifyListeners();
  }
}

