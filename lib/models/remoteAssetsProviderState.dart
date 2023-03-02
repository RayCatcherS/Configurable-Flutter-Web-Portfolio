import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:sr_portfolio/appFunctions.dart';
import 'package:sr_portfolio/pages/homePage/homePageComponents/ProjectGroups/model/ProjectGroupProviderState.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectItemData.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectsGroup.dart';

class RemoteAssetsProviderState extends ChangeNotifier {

  late ProjectGroupsProviderState projectGroupsProviderState;
  updateLinkedModel({
    required ProjectGroupsProviderState projectGroupsModel,
  }) {
    projectGroupsProviderState = projectGroupsModel;
  }

  double loadPageOpacity = 1;
  
  
  
  Future<void> loadAssetsContent(BuildContext context) async {
    
    await Future.delayed(const Duration(seconds: 2));
    

    // download web app data configuration
    
    projectGroupsProviderState.projectsGroups = await _getAndDeserialiseWebbAppDate(context);

    ScaffoldMessenger.of(context).clearSnackBars();
    AppFunctions.showScaffoldMessage("json app data retrieved and deserialized ", context);




    // download web app data
    await _loadAndInitializeMediaData(context);
    

    
    loadPageOpacity = 0;
    notifyListeners();
  }

  Future<List<ProjectGroup>> _getAndDeserialiseWebbAppDate(BuildContext context) async {
    
    List<ProjectGroup> projectGroups = [] ;

    
    ScaffoldMessenger.of(context).clearSnackBars();
    AppFunctions.showScaffoldMessage('starting mediaAssetsConfig.json download', context);


    // get json data file with https request
    final httpMediaAssetsConfigPackageUrl = Uri.parse('https://stefanoromanelli.it/remoteAssets/mediaAssetsConfig.json');
    final http.Response mediaAssetsConfigPackageResponseData = await http.get(httpMediaAssetsConfigPackageUrl);
    final data = json.decode(utf8.decode(mediaAssetsConfigPackageResponseData.bodyBytes));

    for(int i = 0; i < data["assetsData"]["projectGroups"].length; i++) {

      projectGroups.add(
        ProjectGroup.fromJson(
          data["assetsData"]["projectGroups"][i],
        )
      );
    }

    return projectGroups;
  }

  Future<void> _loadAndInitializeMediaData(BuildContext context) async {
    
    ScaffoldMessenger.of(context).clearSnackBars();
    AppFunctions.showScaffoldMessage('starting media assets download', context);


    for(int i = 0; i < projectGroupsProviderState.projectsGroups.length; i++) {
      

      for(int j = 0; j < projectGroupsProviderState.projectsGroups[i].projectItemDataList.length; j++) {

        ProjectItemData item = projectGroupsProviderState.projectsGroups[i].projectItemDataList[j];


        // http request raw imagePreview
        Uri httpPackageUrl = Uri.parse(item.imagePreviewUrl);
        http.Response responseData = await http.get(httpPackageUrl);
        // set raw imagePreview
        item.imagePreviewImgData = responseData.bodyBytes;



        // http request raw imagePlayableReference
        httpPackageUrl = Uri.parse(item.imagePlayableReferenceURL);
        responseData = await http.get(httpPackageUrl);
        // set raw imagePlayableReference
        item.imagePlayableReferenceImgData = responseData.bodyBytes;


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

    


    // set data and show data on the web app
    ScaffoldMessenger.of(context).clearSnackBars();
    AppFunctions.showScaffoldMessage('data assets download complete', context);
  }
}

