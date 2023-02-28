import 'package:flutter/material.dart';

import '../../../../projectsItem/data/projectItemData.dart';

class OtherProjectsProviderState extends ChangeNotifier {
  List<ProjectItemData> otherProjects = [
    ProjectItemData(
      itemType: ItemType.urlImagePlayableReference,
      imagePreviewURL: "https://www.celebrateit.it/sPortfolio/otherProjects/GGJ/FoodsRoots/logo.png",
      imagePlayableReference: "https://www.youtube.com/watch?v=kvMvK_FZabo&ab_channel=LuciaPatrono",

      title: "Foods & Roots",
      description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
      gameAssetImage: "https://www.celebrateit.it/sPortfolio/otherProjects/Celebrate/celebrate_logo.png",
      

      company: Company(companyName: "Global Game Jam Team"),
      professionalRoles: "Game Effects | Game Programming | Game Design",
      platforms: "(Windows)",

      callToActionText: "GGJ Page",
      callToActionUrl: "https://globalgamejam.org/2023/games/foods-roots-7",

      backgroundCoverImage: "https://www.celebrateit.it/sPortfolio/otherProjects/GGJ/FoodsRoots/GGJFR.png",
    ),
    ProjectItemData(
      itemType: ItemType.urlImagePlayableReference,
      imagePreviewURL: "https://www.celebrateit.it/sPortfolio/otherProjects/Celebrate/celebrateVideoPreview.png",
      imagePlayableReference: "https://www.youtube.com/watch?v=oSb0LKCYWYc&ab_channel=Celebrateit",

      title: "Celebrate",
      description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
      gameAssetImage: "https://www.celebrateit.it/sPortfolio/otherProjects/Celebrate/celebrate_logo.png",
      

      company: Company(companyName: "Personal Team Project"),
      professionalRoles: "Front-end Dev | Back-end Dev",
      platforms: "(Web)",

      callToActionText: "Web App",
      callToActionUrl: "https://celebrateit.it/",

      backgroundCoverImage: "https://www.celebrateit.it/sPortfolio/otherProjects/Celebrate/celebrateCover.png",
    ),
  ];
}