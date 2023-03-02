import 'package:flutter/services.dart';
import 'package:sr_portfolio/appFunctions.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectItemData {
  late final String _title;
  late final String _description;
  late final String _gameAssetImageUrl;
  Uint8List gameAssetImageImgData = Uint8List(0);

  late final String _professionalRoles;
  late final String _platforms;
  late final Company _company;

  late final String _backgroundCoverImageUrl;
  Uint8List backgroundCoverImgData = Uint8List(0);
  
  late final String? _backgroundCoverVideoUrl;
  late final String _backgroundDescriptionImage;

  late final String? _callToActionText; 
  late final String? _callToActionUrl;

  late final ItemType _itemType;
  late final YouTubeVideo? _youTubePreviewVideo;
  late final String? _videoPreviewUrl;
  late final String? _imagePreviewUrl;
  Uint8List imagePreviewImgData = Uint8List(0);

  late final String? _imagePlayableReferenceUrl;
  Uint8List imagePlayableReferenceImgData = Uint8List(0);

  late final YoutubePlayerController _yTcontroller;
  YoutubePlayerController get yTcontroller { return _yTcontroller;}


  

  ItemType get itemType { return _itemType;}
  String get title {return _title;}
  String get description {return _description;}
  String get gameAssetImageURL {return _gameAssetImageUrl;}



  String get platforms {return _platforms;}
  String get professionalRoles {return _professionalRoles;}
  Company get company {return _company;}

  String get backgroundCoverImageUrl {return _backgroundCoverImageUrl;}
  String? get backgroundCoverVideoUrl {return _backgroundCoverVideoUrl;}
  


  String get callToActionText {return _callToActionText == null ? "" : _callToActionText!;}
  String get callToActionUrl {return _callToActionUrl == null ? "" : _callToActionUrl!;}

  String get imagePreviewUrl {return _imagePreviewUrl!;}
  String get imagePlayableReferenceURL {return _imagePlayableReferenceUrl!;}


  ProjectItemData({
    required String title,
    required String description,
    required String gameAssetImageUrl,

    required ItemType itemType,
    required String professionalRoles,
    required String platforms,
    required Company company,

    required String backgroundCoverImageUrl,
  

    String? callToActionText,
    String? callToActionUrl,

    YouTubeVideo? youTubeVideo,
    String? videoPreviewUrl,
    String? imagePreviewUrl,
    String? imagePlayableReferenceUrl
  }) {

    _title = title;
    _description = description;
    _gameAssetImageUrl = gameAssetImageUrl;

    _professionalRoles = professionalRoles;
    _platforms = platforms;
    _company = company;


    _backgroundCoverImageUrl = backgroundCoverImageUrl;


    _callToActionText = callToActionText; 
    _callToActionUrl = callToActionUrl;


    _itemType = itemType;
    _youTubePreviewVideo = youTubeVideo;
    if(_youTubePreviewVideo != null) {
      //  _youTubeVideo!.videoId
      _yTcontroller = YoutubePlayerController()..onInit = (){
        _yTcontroller.cueVideoById(videoId: _youTubePreviewVideo!.videoId, startSeconds: 0);
      };

    }

    _videoPreviewUrl = videoPreviewUrl;
    _imagePreviewUrl = imagePreviewUrl;
    _imagePlayableReferenceUrl = imagePlayableReferenceUrl;

    
    
  }
  void openYoutubeVideoPage() {
    AppFunctions.openPageInANewTab("https://youtu.be/${_youTubePreviewVideo!.videoId}");
  }
}


class YouTubeVideo {
  late final String _videoId;
  String get videoId {return _videoId;}
  YouTubeVideo({
    required String videoId
  }) {
    _videoId = videoId;

    
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
  urlImage,
  urlImagePlayableReference,
  urlVideo,
  youTubeVideo
}