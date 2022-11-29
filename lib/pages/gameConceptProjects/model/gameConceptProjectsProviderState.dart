import 'package:flutter/material.dart';

import '../../projectsItem/data/projectItemData.dart';

class GameConceptProjectsProviderState extends ChangeNotifier {
  List<ProjectItemData> gameConceptProjects = [
    ProjectItemData(
      itemType: ItemType.urlImagePlayableReference,
      imagePreviewURL: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/sciFireVideoImage.png",
      imagePlayableReference: "https://youtube.com/shorts/uZXDRLjslM8",
      

      title: "Sci-Fire",
      description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
      gameAssetImage: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/sciFireAsset.png",

      company: Company(companyName: "Personal Project"),
      professionalRoles: "Programmer | Level Design | 3D Artist",
      platforms: "(iOS | Android)",

      callToActionText: "Try It",
      callToActionUrl: "https://celebrateit.it/sciFire/",

      backgroundCoverImage: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/SciFireCoverVideo.gif",
    )
  ];
}
