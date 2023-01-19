import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'pages/Dashboard.dart';
import 'pages/components/banner.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SideMenu(
          controller: page,
          style: SideMenuStyle(
            openSideMenuWidth: 150,
            itemHeight: 50,

            // showTooltip: false,
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: Colors.blue[100],
            selectedColor: Colors.lightBlue,
            selectedTitleTextStyle: const TextStyle(color: Colors.white),
            selectedIconColor: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // blue to dark blue

                  Color(0xFF355262),
                  Color(0xFF3E8597),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: Column(
            children: [
              MediaQuery.of(context).size.width > 600
                  ? ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 150,
                      ),
                      child: const GradientText("Coligo",
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.white70,
                          ]),
                          style: TextStyle(fontSize: 30)),
                    )
                  : const SizedBox.shrink(),
              const Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ],
          ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Dashboard',
              onTap: () {
                page.jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              badgeContent: const Text(
                '3',
                style: TextStyle(color: Colors.white),
              ),
              tooltipContent: "This is a tooltip for Dashboard item",
            ),
            SideMenuItem(
              priority: 1,
              title: 'Users',
              onTap: () {
                page.jumpToPage(1);
              },
              icon: const Icon(Icons.supervisor_account),
            ),
            SideMenuItem(
              priority: 2,
              title: 'Files',
              onTap: () {
                page.jumpToPage(2);
              },
              icon: const Icon(Icons.file_copy_rounded),
              trailing: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 3),
                    child: Text(
                      'New',
                      style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                    ),
                  )),
            ),
            SideMenuItem(
              priority: 3,
              title: 'Download',
              onTap: () {
                page.jumpToPage(3);
              },
              icon: const Icon(Icons.download),
            ),
            SideMenuItem(
              priority: 4,
              title: 'Settings',
              onTap: () {
                page.jumpToPage(4);
              },
              icon: const Icon(Icons.settings),
            ),
            // SideMenuItem(
            //   priority: 5,
            //   onTap: () {
            //     page.jumpToPage(5);
            //   },
            //   icon: const Icon(Icons.image_rounded),
            // ),
            // SideMenuItem(
            //   priority: 6,
            //   title: 'Only Title',
            //   onTap: () {
            //     page.jumpToPage(6);
            //   },
            // ),
            const SideMenuItem(
              priority: 7,
              title: 'Exit',
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            controller: page,
            children: [
              const DashboardPage(),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Users',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Files',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Download',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Only Title',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Only Icon',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
