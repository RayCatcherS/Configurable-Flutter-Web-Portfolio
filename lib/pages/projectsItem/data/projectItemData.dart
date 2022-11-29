import 'package:sr_portfolio/appFunctions.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectItemData {
  late final String _title;
  late final String _description;
  late final String _gameAssetImage;

  late final String _professionalRoles;
  late final String _platforms;
  late final Company _company;

  late final String _backgroundCoverImageURL;
  late final String? _backgroundCoverVideoURL;
  late final String _backgroundDescriptionImage;

  late final String? _callToActionText; 
  late final String? _callToActionUrl;

  late final ItemType _itemType;
  late final YouTubeVideo? _youTubePreviewVideo;
  late final String? _videoPreviewURL;
  late final String? _imagePreviewURL;
  late final String? _imagePlayableReference;

  late final YoutubePlayerController _yTcontroller;
  YoutubePlayerController get yTcontroller { return _yTcontroller;}


  

  ItemType get itemType { return _itemType;}
  String get title {return _title;}
  String get description {return _description;}
  String get gameAssetImage {return _gameAssetImage;}



  String get platforms {return _platforms;}
  String get professionalRoles {return _professionalRoles;}
  Company get company {return _company;}

  String get backgroundCoverImage {return _backgroundCoverImageURL;}
  String? get backgroundCoverVideoURL {return _backgroundCoverVideoURL;}
  


  String get callToActionText {return _callToActionText == null ? "" : _callToActionText!;}
  String get callToActionUrl {return _callToActionUrl == null ? "" : _callToActionUrl!;}

  String get imagePreviewURL {return _imagePreviewURL!;}
  String get imagePlayableReference {return _imagePlayableReference!;}


  ProjectItemData({
    required String title,
    required String description,
    required String gameAssetImage,

    required ItemType itemType,
    required String professionalRoles,
    required String platforms,
    required Company company,

    required String backgroundCoverImage,
  

    String? callToActionText,
    String? callToActionUrl,

    YouTubeVideo? youTubeVideo,
    String? videoPreviewURL,
    String? imagePreviewURL,
    String? imagePlayableReference
  }) {

    _title = title;
    _description = description;
    _gameAssetImage = gameAssetImage;

    _professionalRoles = professionalRoles;
    _platforms = platforms;
    _company = company;


    _backgroundCoverImageURL = backgroundCoverImage;


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

    _videoPreviewURL = videoPreviewURL;
    _imagePreviewURL = imagePreviewURL;
    _imagePlayableReference = imagePlayableReference;

    
    
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