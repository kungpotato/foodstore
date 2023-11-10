import 'package:emer_app/data/group_data.dart';
import 'package:emer_app/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _index = 0;
  String _filter = '';

  final List<GroupData> groupList = [
    GroupData(groupId: '1', group: 'ปลา', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '2', group: 'ผักผลไม้', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '3', group: 'เนื้อ', img: 'assets/images/pngegg.png'),
    GroupData(
        groupId: '4', group: 'เครื่องดื่ม', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '5', group: 'ของหวาน', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '6', group: 'เส้น', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '6', group: 'ยำทะเล', img: 'assets/images/pngegg.png'),
    GroupData(groupId: '6', group: 'ขนม', img: 'assets/images/pngegg.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: IconButton(
            icon: Icon(FeatherIcons.alignJustify, size: 50), onPressed: () {}),
        title: Text(
          'เลือกเมนู',
          style: context.theme.textTheme.headlineLarge
              ?.copyWith(color: context.theme.primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildMenu(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 35,
                childAspectRatio: 0.8,
                mainAxisSpacing: 35,
                children: List.generate(
                    20,
                    (index) => Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.hardEdge,
                          elevation: 8,
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: 400,
                                  child: Image.asset(
                                      'assets/images/18739625_974141176022438_5761220182276635497_n.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Text('xxxxxxxxxxx'),
                              Text('xxxxxxxxxxx'),
                              Text('xxxxxxxxxxx')
                            ],
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 140,
            height: 160,
            child: IconButton(
              splashRadius: 80,
              onPressed: () {
                setState(() {
                  _index = 0;
                  _filter = '';
                });
              },
              icon: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: 0 == _index
                              ? Border.all(
                                  color: context.theme.primaryColor, width: 5)
                              : null),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: 0 == _index
                            ? context.theme.primaryColor
                            : Colors.grey.shade200,
                        child: Text(
                          'All',
                          style: context.theme.textTheme.headlineMedium
                              ?.copyWith(
                                  color: 0 == _index
                                      ? Colors.white
                                      : context.theme.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Flexible(child: SizedBox())
                ],
              ),
            ),
          ),
          ...groupList
              .asMap()
              .entries
              .map(
                (e) => SizedBox(
                  width: 140,
                  height: 160,
                  child: IconButton(
                    splashRadius: 70,
                    onPressed: () {
                      setState(() {
                        _index = e.key + 1;
                        _filter = e.value.group;
                      });
                    },
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: e.key + 1 == _index
                                      ? Border.all(
                                          color: context.theme.primaryColor,
                                          width: 5)
                                      : null),
                              child: CircleAvatar(
                                radius: 100,
                                backgroundColor: Colors.grey.shade200,
                                backgroundImage: AssetImage(e.value.img),
                              ),
                            )),
                        Flexible(
                            child: Text(
                          e.value.group,
                          style: context.theme.textTheme.headlineSmall,
                        )),
                      ],
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
