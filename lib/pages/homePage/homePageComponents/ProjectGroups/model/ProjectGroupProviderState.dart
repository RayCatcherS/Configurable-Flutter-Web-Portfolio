import 'package:flutter/cupertino.dart';
import 'package:sr_portfolio/pages/projectsItem/data/projectsGroup.dart';

import '../../../../projectsItem/data/projectItemData.dart';

class ProjectGroupsProviderState extends ChangeNotifier {

  List<ProjectGroup> projectsGroups = [

    // Professional Projects
    ProjectGroup(
      "Professional Projects",
      "A sample of the game titles that I've worked on over the years",
      [ // personal projects data list
        ProjectItemData(
          itemType: ItemType.urlImagePlayableReference,
          imagePreviewURL: "https://celebrateit.it/sPortfolio/professionalProjectImages/MCTC/MCTCVideoImage.png",
          imagePlayableReference: "https://www.youtube.com/watch?v=d2o9U2H_hgM&ab_channel=TEDDYNetwork",

          title: "My Clinical Trial Center",
          description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
          gameAssetImage: "https://celebrateit.it/sPortfolio/professionalProjectImages/MCTC/ChildSpriteBase.png",

          company: Company(companyName: "HERO s.r.l."),
          professionalRoles: "Software Enginer | Programmer | Level Design | 3D Artist",
          platforms: "(iOS | Android)",

          callToActionText: "Article / Download",
          callToActionUrl: "https://www.cvbf.net/news/my-clinical-trial-center-serious-videogame",

          backgroundCoverImage: "https://celebrateit.it/sPortfolio/professionalProjectImages/MCTC/MCTCCoverImage.png",
        )
      ]
    ),

    // Personal Projects
    ProjectGroup(
      "Personal Projects",
      "A sample of the personal game projects that I've worked",
      [
        ProjectItemData(
          itemType: ItemType.urlImage,
          imagePreviewURL: "https://celebrateit.it/sPortfolio/personalProjectImages/Vergeltung/control.gif",

          title: "Vergeltung",
          description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
          gameAssetImage: "https://celebrateit.it/sPortfolio/personalProjectImages/Vergeltung/VergeltungAsset.png",

          company: Company(companyName: "University Project"),
          professionalRoles: "Software Enginer | Programmer | AI | Level Design | 3D Artist",
          platforms: "(iOS | Android)",

          callToActionText: "Github / Download",
          callToActionUrl: "https://github.com/RayCatcherS/Vergeltung",

          backgroundCoverImage: "https://www.celebrateit.it/sPortfolio/Immagine9.png",
        ),
      ]
    ),

    // Personal Game Concept Projects
    ProjectGroup(
      "Personal Game Concept Projects",
      "A concepts of the game titles that I prototype",
      [
        ProjectItemData(
          itemType: ItemType.urlImagePlayableReference,
          imagePreviewURL: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/sciFireVideoImage.png",
          imagePlayableReference: "https://youtube.com/shorts/uZXDRLjslM8",
          

          title: "Sci-Fire",
          description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
          gameAssetImage: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/sciFireAsset.png",

          company: Company(companyName: "Personal Project"),
          professionalRoles: "Programmer | Game Design | Level Design | 3D Artist",
          platforms: "(iOS | Android)",

          callToActionText: "Try It",
          callToActionUrl: "https://celebrateit.it/sciFire/",

          backgroundCoverImage: "https://celebrateit.it/sPortfolio/personalProjectImages/SciFire/SciFireCoverVideo.gif",
        ),
        ProjectItemData(
          itemType: ItemType.urlImagePlayableReference,
          imagePreviewURL: "https://celebrateit.it/sPortfolio/personalProjectImages/7AM/7AMVideoPreview.png",
          imagePlayableReference: "https://youtu.be/2QCzSmXjU60",
          

          title: "07:00 AM",
          description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
          gameAssetImage: "https://celebrateit.it/sPortfolio/personalProjectImages/7AM/7AMAsset.png",

          company: Company(companyName: "Personal Project"),
          professionalRoles: "Programmer | 3D Artist | Level Design",
          platforms: "(iOS | Android)",

          callToActionText: "Try It",
          callToActionUrl: "https://celebrateit.it/sciFire/",

          backgroundCoverImage: "https://celebrateit.it/sPortfolio/personalProjectImages/7AM/7AMCover.gif",
        )
      ]
    ),
    // other projects
    ProjectGroup(
      "Other Personal Projects",
      "Other projects in collaboration / in which I have collaborated",
      [
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
          imagePreviewURL: "https://www.celebrateit.it/sPortfolio/otherProjects/GGJ/FoodsRoots/logo.png",
          imagePlayableReference: "https://www.youtube.com/watch?v=kvMvK_FZabo&ab_channel=LuciaPatrono",

          title: "Muovo",
          description: "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.",
          gameAssetImage: "https://www.celebrateit.it/sPortfolio/otherProjects/Celebrate/celebrate_logo.png",
          

          company: Company(companyName: "University Project"),
          professionalRoles: "User Interface Design | User Centered Design",
          platforms: "(Figma)",

          callToActionText: "Figma Demo",
          callToActionUrl: "https://www.figma.com/proto/lkGJBYXgwYSFmFQbZrc7w9/Prototipo-Interattivo-Finale---Alta-fedelt%C3%A0?node-id=19%3A425&starting-point-node-id=19%3A425",

          backgroundCoverImage: "https://www.celebrateit.it/sPortfolio/otherProjects/UniversityProjects/figmasheet.png",
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
      ]
    )
  ];
}