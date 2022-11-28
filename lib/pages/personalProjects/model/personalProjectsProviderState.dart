import 'package:flutter/material.dart';

import '../../projectsItem/data/projectItemData.dart';

class PersonalProjectsProviderState extends ChangeNotifier {
  List<ProjectItemData> personalProjects = [
    ProjectItemData(
      itemType: ItemType.urlImage,
      imageURL: "https://celebrateit.it/sPortfolio/personalProjectImages/Vergeltung/control.gif",
      /*itemType: ItemType.youTubeVideo,
      youTubeVideo: YouTubeVideo(videoId: "fV9oHE8YZ9I"),*/

      // gif https://github.com/RayCatcherS/Vergeltung/blob/main/DevDiary/(7)%20diary_issue%2349-28-42-43/control.gif

      title: "Vergeltung",
      description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
      gameAssetImage: "https://celebrateit.it/sPortfolio/personalProjectImages/Vergeltung/VergeltungAsset.png",

      company: Company(companyName: "University Project"),
      professionalRoles: "Software Enginer | Programmer | AI | Level Design | 3D Artist",
      platforms: "(iOS | Android)",

      callToActionText: "Github / Download",
      callToActionUrl: "https://github.com/RayCatcherS/Vergeltung",

      backgroundCoverImage: "https://www.celebrateit.it/sPortfolio/Immagine9.png",
    )
  ];
}