class ProjectItemData {
  late final String _title;
  late final String _description;
  late final String _professionalRoles;
  late final String _platforms;
  late final Company _company;

  late final String _backgroundCoverImage;
  late final String _backgroundDescriptionImage;

  late final String? _callToActionText; 
  late final String? _callToActionUrl;

  late final ItemType _itemType;
  late final YouTubeVideo? _youTubeVideo;
  late final String? _videoURL;
  late final String? _imageURL;

  ItemType get itemType { return _itemType;}
  String get title {return _title;}
  String get description {return _description;}
  String get platforms {return _platforms;}
  String get professionalRoles {return _professionalRoles;}
  Company get company {return _company;}

  String get backgroundCoverImage {return _backgroundCoverImage;}


  String get callToActionText {return _callToActionText == null ? "" : _callToActionText!;}
  String get callToActionUrl {return _callToActionUrl == null ? "" : _callToActionUrl!;}

  ProjectItemData({
    required String title,
    required String description,
    required ItemType personalItemType,
    required String professionalRoles,
    required String platforms,
    required Company company,

    required String backgroundCoverImage,


    String? callToActionText,
    String? callToActionUrl,

    YouTubeVideo? youTubeVideo,
    String? videoURL,
    String? imageURL
  }) {

    _title = title;
    _description = description;
    _professionalRoles = professionalRoles;
    _platforms = platforms;
    _company = company;


    _backgroundCoverImage = backgroundCoverImage;


    _callToActionText = callToActionText; 
    _callToActionUrl = callToActionUrl;


    _itemType = personalItemType;
    _youTubeVideo = youTubeVideo;
    _videoURL = videoURL;
    _imageURL = imageURL;
  }
}


class YouTubeVideo {
  late final String _videoId;

  YouTubeVideo({required String videoId}) {
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
  urlVideo,
  youTubeVideo
}