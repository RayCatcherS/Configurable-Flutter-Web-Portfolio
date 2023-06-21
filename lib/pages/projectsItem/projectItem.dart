import 'dart:ui';

import 'package:GameDevPortfolio/UI/responsive.dart';
import 'package:GameDevPortfolio/appFunctions.dart';
import 'package:GameDevPortfolio/costants/widget_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
//import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../costants/font_styles.dart';
import 'data/projectItemData.dart';

//import 'package:pointer_interceptor/pointer_interceptor.dart';


class ProjectItem extends StatelessWidget {

  final ProjectItemData projectItemData;
  
  const ProjectItem({
    Key? key,
    required this.projectItemData
  }) : super(key: key);

  final int textContentFlexSize = 3; 
  final int mediaFlexSize = 3;
  final double mediaHeight = 250;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Stack(
          children: [
            // cover project background 
            Positioned.fill(
              child: projectItemData.backgroundCoverImgData.isNotEmpty ? 
              
              Image.memory(
                  projectItemData.backgroundCoverImgData,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
              ) : 

              projectItemData.backgroundType == ItemCoverBackgroundType.video ?
              ClipRRect(
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      height: projectItemData.itemBackgroundVideoController.value.size.height,
                      width: projectItemData.itemBackgroundVideoController.value.size.width,
                      child: VideoPlayerWidget(controller: projectItemData.itemBackgroundVideoController)
                    )
                  ),
                ),
              ) :
              Container()
            ),

            // cover image background color filter
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.45),
              )
            ),

            // project item cover render
            Center(
              child: Padding(
                padding: getPagePadding(context),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: kMaxWidthPage
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 8.5),
                    child: Column(
                      children: [

                        if(!Responsive.isMobile(context))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Expanded(
                              flex: textContentFlexSize,
                              child: getCoverTextWidget(context),
                            ),
                            Spacer(),
                            Expanded(
                              flex: mediaFlexSize,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(kBorderRadius),
                                child: getCoverMediaWidget(context)
                              )
                            ),
                            
                          ],
                        ),

                        if(Responsive.isMobile(context))
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(kBorderRadius),
                              child: getCoverMediaWidget(context)
                            ),
                            SizedBox(height: kDefaultPadding * 3),
                            getCoverTextWidget(context) 
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        // project description and mansions
        Stack(
          children: [

            // background project description 
            Positioned.fill(
              child: ClipRRect(
                child: ImageFiltered(
                  imageFilter: Responsive.isMobile(context) ? // Mobile browser doesn't support sigma over a 30 value
                  ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.decal) :
                  ImageFilter.blur(sigmaX: 100, sigmaY: 100, tileMode: TileMode.decal),
                  child: projectItemData.backgroundCoverImgData.isNotEmpty ? 
                  Image.memory(
                      projectItemData.backgroundCoverImgData,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                  ) : Image.memory(
                      projectItemData.imageMediaPreviewImgData,
                      fit: BoxFit.cover,
                      
                      alignment: Alignment.center,
                  ),
                ),
              ),
            ),

            // description image background color filter
            Positioned.fill(
              child: Container(
                color: Responsive.isMobile(context) ? 
                Colors.black.withOpacity(0.7) :
                Colors.black.withOpacity(0.1),
              )
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ?
                  kDefaultDesktopPagePadding : 
                  Responsive.isTablet(context) ?
                  kDefaultTabletPagePadding : kDefaultMobilePagePadding
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: kMaxWidthPage
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 8.5),
                    child: 
                    !Responsive.isMobile(context) ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: getProjectInformation()
                        ),
                        Expanded(
                          child: getProjectGameAssetPhoto() 
                        )
                      ],
                    ) : Column(
                      children: [
                        getProjectGameAssetPhoto(),
                        SizedBox(height: kDefaultPadding * 3),
                        getProjectInformation()
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget getCoverMediaWidget(BuildContext context) {
    if(projectItemData.itemType == ItemType.image) {
      return AspectRatio(
        aspectRatio: 15/9,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: CircularProgressIndicator()
            ),
            projectItemData.imageMediaPreviewImgData.isEmpty ? Container() :
            Image.memory(
              projectItemData.imageMediaPreviewImgData,
              fit: BoxFit.cover,
            ),
          ],
        ),
      );
    } else if(projectItemData.itemType == ItemType.imagePlayableReference) {
      return AspectRatio(
        aspectRatio: 15/9,
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                AppFunctions.openPageInANewTab(projectItemData.imagePlayableReferenceUrl);
                
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  projectItemData.imageMediaPreviewImgData.isEmpty ? Container() :
                  Image.memory(
                    projectItemData.imageMediaPreviewImgData,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 65,
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      );
    } else if(projectItemData.itemType == ItemType.video) {
      return AspectRatio(
        aspectRatio: 15/9,
        child: 
        Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: VideoPlayerWidget(
                controller: projectItemData.videoMediaPreviewController,
              ) 
            ),
          ],
        ),
      );
    } else if(projectItemData.itemType == ItemType.youTubeVideo) {
      return AspectRatio(
        aspectRatio: 15/9,
        child: Stack(
          children: [
            /*YoutubeValueBuilder(
              controller: projectItemData.yTcontroller, // This can be omitted, if using `YoutubePlayerControllerProvider`
              builder: (context, value) {
                  return Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 15 / 9,
                        child: YoutubePlayerWidget()
                        
                      ),
                      PointerInterceptor(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            
                            InkWell(
                              onTap: () {
                                if(value.playerState == PlayerState.playing) {
                                  projectItemData.yTcontroller.pauseVideo();
                                } else {
                                  projectItemData.yTcontroller.playVideo();
                                }

                              },
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {

                                  if(value.playerState == PlayerState.playing || value.playerState == PlayerState.paused) {
                                    projectItemData.yTcontroller.pauseVideo();
                                    projectItemData.openYoutubeVideoPage();
                                  }
                                  
                                },
                                child: Container(
                                  height: 35,
                                  width: 80,
                                  //color: Colors.red.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
              },
            ),*/
            
            
          ],
        ),
      );

    } else {
      return Text("Media Error");
    }
  }
  Widget getCoverTextWidget(BuildContext context) {
    return Column(
      children: [

        // project title
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.title,
                style: FontStyles.melodiMediumTitle,
              )
            ),
          ],
        ),

        // professional roles
        SizedBox(height: kDefaultPadding * 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.professionalRoles,
                style: FontStyles.melodiMediumSubTitle,
              )
            ),
          ],
        ),

        // company project
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.company.companyName,
                style: FontStyles.melodiLightSubTitle,
              )
            ),
          ],
        ),

        // project platform
        SizedBox(height: kDefaultPadding / 2),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.platforms,
                style: FontStyles.melodiLightSubTitle,
              )
            ),
          ],
        ),
        

        // call to action
        Column(
          children: [
            if(projectItemData.callToActionText != "")
            SizedBox(height: kDefaultPadding * 5),
            if(projectItemData.callToActionText != "")
            MaterialButton(
              color: Colors.purple[900],
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 1),
                child: Text(
                  projectItemData.callToActionText,
                  style: FontStyles.melodiLightButtonText,
                ),
              ),
              onPressed: () {
                AppFunctions.openPageInANewTab(projectItemData.callToActionUrl);
              },
            )
          ],
        )
      ],
    );
  }


  Widget getProjectInformation() {
    return Column(
      children: [

        // project mansion description
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.professionalRoles,
                style: FontStyles.melodiMediumSubTitle,
              )
            ),
          ],
        ),
        SizedBox(height: kDefaultPadding * 1.5),
        Row(
          children: [
            Expanded(
              child: Text(
                projectItemData.description,
                style: FontStyles.melodiLight,
              )
            ),
          ],
        ),
      ],
    );
  }
  Widget getProjectGameAssetPhoto() {
    return Center(
      child: AspectRatio(
        aspectRatio: 20/9,
        child: projectItemData.gameAssetImageImgData.isEmpty ? Container() :
        Image.memory(
                          
            projectItemData.gameAssetImageImgData,
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
        ),
      ),
    );
  }

}


// ignore: must_be_immutable
class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget({
    Key? key,
    required VideoPlayerController this.controller
  }) : super(key: key);

  VideoPlayerController controller;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {


  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (visibilityInfo) {

        widget.controller.play();
      },
      child: widget.controller.value.isInitialized
              ? VideoPlayer(widget.controller)
              : Container(),
    );
  }
}

/*class YoutubePlayerWidget extends StatefulWidget {
  YoutubePlayerWidget({Key? key}) : super(key: key);

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
 final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'ZQyLJIytbTU',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _controller,
      builder: (context, player) {
        return player;
      },
    );
  }
}*/