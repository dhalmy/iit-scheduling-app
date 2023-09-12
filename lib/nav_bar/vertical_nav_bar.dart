import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/home/home.dart';

import '../hover_builder.dart';

class VerticalNavigationBar extends StatefulWidget {
  const VerticalNavigationBar({super.key});

  @override
  State<VerticalNavigationBar> createState() => _VerticalNavigationBarState();
}

class _VerticalNavigationBarState extends State<VerticalNavigationBar> {
  final PageController _page = PageController();
  String stringCurrentState = '';
  final SideMenuController _sideMenu = SideMenuController();

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: _sideMenu,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.black12,
              selectedColor: Colors.black,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              unselectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              unselectedIconColor: Colors.white,
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 79, 117, 134),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              backgroundColor: const Color(0xFF0f0530),
            ),
            title: Container(
              margin: const EdgeInsets.only(top: 14),
              alignment: Alignment.center,
              height: sh * 0.15,
              width: sw * 0.15,
              child: Column(
                children: <Widget>[
                  // Expanded(
                  // child: SvgPicture.asset(
                  //   'assets/sgicon.svg',
                  // ),
                  Container(),
                  // ),
                  if (sh > 720 && sw > 720)
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "CyberGoose",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(2),
                      child: HoverBuilder(builder: (isHovering) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: isHovering ? Colors.black12 : null,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.only(
                                left: 8, top: 2, right: 8, bottom: 2),
                            child: const Text(
                              "CyberGoose",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            items: [
              SideMenuItem(
                // priority: 0,
                title: 'Password Reset',
                onTap: (page, _) {
                  //RegistryAccess.getPasswordPolicy();
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.password),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SideMenuItem(
                // priority: 1,
                title: 'Password Restrictions',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                // priority: 2,
                title: 'Event Logs',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
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
              // SideMenuItem(
              //   priority: 3,
              //   title: 'Logging Tests',
              //   onTap: (page, _) {
              //     _sideMenu.changePage(page);
              //   },
              //   icon: const Icon(Icons.download),
              // ),
              SideMenuItem(
                // priority: 3,
                title: 'Initialization Policies',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.settings),
              ),
              SideMenuItem(
                // priority: 4,
                title: 'Auto Updates',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.autorenew),
              ),
              // SideMenuItem(
              //   priority: 6,
              //   title: 'Removable Devices',
              //   onTap: (page, _) {
              //     _sideMenu.changePage(6);
              //   },
              //   icon: const Icon(Icons.add_circle),
              // ),
              SideMenuItem(
                // priority: 5,
                title: 'System Privileges',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.wallet),
              ),
              SideMenuItem(
                // priority: 6,
                title: 'Installation Restrictions',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.zoom_in),
              ),
              SideMenuItem(
                // priority: 7,
                title: 'Firewall and Real-time Protection State',
                onTap: (page, _) {
                  _sideMenu.changePage(page);
                },
                icon: const Icon(Icons.qr_code),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _page,
              children: [
                // Container(
                //   width: double.infinity,
                //   height: double.infinity,
                //   decoration: const BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       stops: [0.1, 0.5, 0.9],
                //       colors: [
                //         Color(0xFF0f0530),
                //         Color(0xFF5e48ab),
                //         Color(0xFF0f0530),
                //       ],
                //     ),
                //   ),
                //   child: const Center(),
                // ),
                Home(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
