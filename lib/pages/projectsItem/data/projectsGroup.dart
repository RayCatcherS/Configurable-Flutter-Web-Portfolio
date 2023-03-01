import 'projectItemData.dart';

class ProjectGroup {

  late final String _projectGroupName;
  late final String _projectGroupDescription;
  late final List<ProjectItemData> _projectItemDataList;
  ProjectGroup(String projectGroupName, String projectGroupDescription, List<ProjectItemData> projectItemDataList) {
    _projectGroupName = projectGroupName;
    _projectGroupDescription = projectGroupDescription;
    _projectItemDataList = projectItemDataList;
  }
  List<ProjectItemData> get projectItemDataList {
    return _projectItemDataList;
  }
  String get projectGroupName {
    return _projectGroupName;
  }
  String get projectGroupDescription {
    return _projectGroupDescription;
  }
}