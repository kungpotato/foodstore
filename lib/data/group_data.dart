class GroupData {
  final String group;
  final String img;
  final String groupId;

  GroupData({
    required this.group,
    required this.img,
    required this.groupId,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) {
    return GroupData(
      group: json['group'] as String,
      img: json['img'] as String,
      groupId: json['groupId'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'group': group,
      'img': img,
      'groupId': groupId,
    };
  }
}
