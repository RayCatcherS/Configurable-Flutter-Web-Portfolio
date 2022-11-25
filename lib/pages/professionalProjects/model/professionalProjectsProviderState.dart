import 'package:flutter/cupertino.dart';

import '../../projectsItem/data/projectItemData.dart';

class ProfessionalProjectProviderState extends ChangeNotifier {

  // personal projects data list
  List<ProjectItemData> personalProjects = [
    ProjectItemData(
      personalItemType: ItemType.youTubeVideo,
      youTubeVideo: YouTubeVideo(videoId: "https://www.youtube.com/watch?v=d2o9U2H_hgM&ab_channel=TEDDYNetwork" /* ID - d2o9U2H_hgM */),

      title: "My Clinical Trial Center",
      description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
      company: Company(companyName: "HERO s.r.l."),
      professionalRoles: "Software Enginer | Programmer | Level Design | 3D Artist",
      platforms: "(iOS | Android)",

      callToActionText: "Article / Download",
      callToActionUrl: "https://www.cvbf.net/news/my-clinical-trial-center-serious-videogame",

      backgroundCoverImage: "https://celebrateit.it/sPortfolio/professionalProjectImages/MCTCCoverImage.png",
    )
  ];
  // notifyListeners();
}