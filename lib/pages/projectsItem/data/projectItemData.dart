import 'package:GameDevPortfolio/appFunctions.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectItemData {

  

  late final String _title;
  late final String _description;
  late final String _gameAssetImageUrl;
  Uint8List gameAssetImageImgData = Uint8List(0);

  late final String _professionalRoles;
  late final String _platforms;
  late final Company _company;




  late final ItemCoverBackgroundType _backgroundType;
  late final String _backgroundCoverImageUrl;
  Uint8List backgroundCoverImgData = Uint8List(0);
  
  late final String? _backgroundCoverVideoUrl;
  late final VideoPlayerController itemBackgroundVideoController;




  late final String? _callToActionText; 
  late final String? _callToActionUrl;


  late final ItemType _itemType;
  late final String? _mediaPreviewUrl;
  Uint8List imageMediaPreviewImgData = Uint8List(0);
  late final VideoPlayerController videoMediaPreviewController;

  


  late final String? _imagePlayableReferenceUrl;

  late YoutubePlayerController yTcontroller = YoutubePlayerController();


  

  ItemType get itemType { return _itemType;}
  String get title {return _title;}
  String get description {return _description;}
  String get gameAssetImageURL {return _gameAssetImageUrl;}



  String get platforms {return _platforms;}
  String get professionalRoles {return _professionalRoles;}
  Company get company {return _company;}

  
  ItemCoverBackgroundType  get backgroundType {return _backgroundType;}
  String get backgroundCoverImageUrl {return _backgroundCoverImageUrl;}
  String? get backgroundCoverVideoUrl {return _backgroundCoverVideoUrl;}
  


  String get callToActionText {return _callToActionText == null ? "" : _callToActionText!;}
  String get callToActionUrl {return _callToActionUrl == null ? "" : _callToActionUrl!;}

  String get mediaPreviewUrl {return _mediaPreviewUrl!;}
  String get imagePlayableReferenceUrl {return _imagePlayableReferenceUrl!;}


  ProjectItemData({
    required String title,
    required String description,
    required String gameAssetImageUrl,

    required ItemType itemType,
    required String professionalRoles,
    required String platforms,
    required Company company,

    required ItemCoverBackgroundType backgroundType,
    required String backgroundCoverImageUrl,
    required String backgroundCoverVideoUrl,
  

    String? callToActionText,
    String? callToActionUrl,

    String? mediaPreviewUrl,
    String? imagePlayableReferenceUrl
  }) {

    _title = title;
    _description = description;
    _gameAssetImageUrl = gameAssetImageUrl;

    _professionalRoles = professionalRoles;
    _platforms = platforms;
    _company = company;


    _backgroundType = backgroundType;
    _backgroundCoverImageUrl = backgroundCoverImageUrl;
    _backgroundCoverVideoUrl = backgroundCoverVideoUrl;


    _callToActionText = callToActionText; 
    _callToActionUrl = callToActionUrl;


    _itemType = itemType;
    
    
    _mediaPreviewUrl = mediaPreviewUrl;
    _imagePlayableReferenceUrl = imagePlayableReferenceUrl;

    
    
  }
  void openYoutubeVideoPage() {
    AppFunctions.openPageInANewTab(_imagePlayableReferenceUrl!);
  }
}



class Company {
  late final String _companyName;
  late final String _companyURL;

  String get companyName {return _companyName;}
  String get companyURL {return _companyURL;}

  Company({
    required companyName,
    companyURL = ""
  }) {
    _companyName = companyName;
    _companyURL = companyURL;
  }
}

enum ItemType {
  image,
  imagePlayableReference,
  video,
  youTubeVideo
}

enum ItemCoverBackgroundType {
  image,
  video,
}