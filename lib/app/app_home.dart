import 'package:emer_app/data/group_data.dart';
import 'package:emer_app/shared/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _index = 0;
  String _filter = '';
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

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
      body: SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          title: Text(
            'เลือกเมนู',
            style: context.theme.textTheme.headlineLarge
                ?.copyWith(color: context.theme.primaryColor),
          ),
        ),
        slider: ListView(
          children: [
            ListTile(
              title: Text('เพิ่มรายการ'),
              leading: Icon(Icons.add_circle),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Column(
            children: [
              SizedBox(height: 20),
              _buildMenu(),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 30,
                  children: List.generate(
                      20,
                      (index) => InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  'ขาหมู',
                                                  style: context.theme.textTheme
                                                      .headlineLarge
                                                      ?.copyWith(
                                                          color: Colors.black),
                                                ),
                                                trailing: Text(
                                                  '244 บาท',
                                                  style: context.theme.textTheme
                                                      .headlineLarge
                                                      ?.copyWith(
                                                          color: Colors.black),
                                                ),
                                              ),
                                              _radioSelectItem(),
                                              _checkBoxSelectItem(),
                                              _radioSelectItem(),
                                              _checkBoxSelectItem(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.remove,
                                                        )),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 30,
                                                            left: 30),
                                                    child: Text(
                                                      '1',
                                                      style: context
                                                          .theme
                                                          .textTheme
                                                          .headlineLarge,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: IconButton(
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.add,
                                                        )),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      ElevatedButton(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'เพิ่มไปยังตะกร้า',
                                              style: context
                                                  .theme.textTheme.headlineSmall
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () {})
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              margin: EdgeInsets.zero,
                              clipBehavior: Clip.hardEdge,
                              elevation: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'xxxxxxxxxxx',
                                            style: context
                                                .theme.textTheme.headlineSmall
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.2),
                                          ),
                                          Text(
                                            'xxxxxxxxxxx',
                                            style: context
                                                .theme.textTheme.titleLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.2),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '200 ฿',
                                                style: context
                                                    .theme.textTheme.titleMedium
                                                    ?.copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationThickness: 3),
                                              ),
                                              Text(
                                                '150 ฿',
                                                style: context.theme.textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: context
                                                      .theme.primaryColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _radioSelectItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'xxxxxxx',
          style: context.theme.textTheme.headlineMedium,
        ),
        ListTile(
          leading:
              Radio<String>(value: 'xx', groupValue: 'xx', onChanged: (val) {}),
          title: Text(
            'ข้าวอบไก่ย่าง',
            style: context.theme.textTheme.headlineSmall,
          ),
          trailing: Text(
            '+0',
            style: context.theme.textTheme.headlineSmall,
          ),
        ),
        ListTile(
          leading:
              Radio<String>(value: 'xx', groupValue: 'x', onChanged: (val) {}),
          title: Text(
            'ข้าวอบหมูย่าง',
            style: context.theme.textTheme.headlineSmall,
          ),
          trailing: Text(
            '+0',
            style: context.theme.textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }

  Widget _checkBoxSelectItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'yyyyyyyyy',
          style: context.theme.textTheme.headlineMedium,
        ),
        ListTile(
          leading: Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          title: Text(
            'ข้าวอบไก่ย่าง',
            style: context.theme.textTheme.headlineSmall,
          ),
          trailing: Text(
            '+0',
            style: context.theme.textTheme.headlineSmall,
          ),
        ),
        ListTile(
          leading: Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          title: Text(
            'ข้าวอบหมูย่าง',
            style: context.theme.textTheme.headlineSmall,
          ),
          trailing: Text(
            '+0',
            style: context.theme.textTheme.headlineSmall,
          ),
        ),
      ],
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
