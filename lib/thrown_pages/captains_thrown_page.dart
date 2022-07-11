import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_club.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../bottom_nav_stats_pages/bottom_navigator.dart';
import '../thrown_searches/captains_thrown_search.dart';
import '../api/club_captains_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/club_captains_details_page.dart';
import '../notifier/club_captains_notifier.dart';


String clubName = "AFC Binley FC";
String thrownName = "Football Club Captains";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String whoWeAre = "Who We Are";
String aboutSchool = "About $clubName";
String tablesAndStats = "Tables and Stats";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";


Color backgroundColor = const Color.fromRGBO(166, 141, 173, 1);
Color appBarTextColor = const Color.fromRGBO(99, 73, 107, 1.0);
Color appBarBackgroundColor = const Color.fromRGBO(166, 141, 173, 1);
Color appBarIconColor = const Color.fromRGBO(99, 73, 107, 1.0);
Color modalColor = Colors.transparent;
Color modalBackgroundColor = const Color.fromRGBO(166, 141, 173, 1);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = const Color.fromRGBO(99, 73, 107, 1.0);
Color splashColor = const Color.fromRGBO(166, 141, 173, 1);
Color splashColorTwo = Colors.black87;
Color iconColor = Colors.white70;
Color iconColorTwo = const Color.fromRGBO(99, 73, 107, 1.0);
Color textColor = Colors.white70;
Color textColorTwo = const Color.fromRGBO(99, 73, 107, 1.0);
Color dialogBackgroundColor = const Color.fromRGBO(166, 141, 173, 1);
Color borderColor = Colors.black;


class MyCaptainsPage extends StatefulWidget with NavigationStates{
  MyCaptainsPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyCaptainsPage> createState() => _MyCaptainsPage();
}

class _MyCaptainsPage extends State<MyCaptainsPage> {

  Widget _buildProductItem(BuildContext context, int index) {

    late CaptainsNotifier captainsNotifier = Provider.of<CaptainsNotifier>(context);


    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              captainsNotifier.currentCaptains = captainsNotifier.captainsList[index];
              navigateToCaptainsDetailsPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: const Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                captainsNotifier.captainsList[index].image!
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  captainsNotifier.captainsList[index].name!,
                                  style: GoogleFonts.tenorSans(
                                    color: textColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600
                                  )

                              ),
                              const SizedBox(width: 10),
                              Icon (
                                MdiIcons.shieldCheck,
                                color: iconColor,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              captainsNotifier.captainsList[index].teamCaptaining!,
                              style: GoogleFonts.tenorSans(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColorTwo
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColorTwo
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColorTwo
              ),
            ),
          ),
          TextButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColorTwo
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToCaptainsDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CaptainsDetailsPage()));
  }

  Future navigateTablesAndStatsDetails(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigator()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AcronymsMeanings()));
  }
  Future navigateToAboutSchoolDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutClubDetails()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const WhoWeAre()));
  }

  @override
  void initState() {
    CaptainsNotifier captainsNotifier = Provider.of<CaptainsNotifier>(context, listen: false);
    getCaptains(captainsNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    CaptainsNotifier captainsNotifier = Provider.of<CaptainsNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColorTwo),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalColor,
                            context: context,
                            builder: (context) => Container(
                              // height: 250,
                              decoration: BoxDecoration(
                                color: modalBackgroundColor,
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorTwo,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 35.0, right: 8.0, left: 8.0),
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                            leading: Icon(MdiIcons.tableMultiple,
                                              color: iconColorTwo,
                                            ),
                                            title: Text(tablesAndStats,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColorTwo
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateTablesAndStatsDetails(context);
                                            }
                                        ),
                                        ListTile(
                                            leading: Icon(MdiIcons.atom,
                                            color: iconColorTwo,
                                            ),
                                            title: Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColorTwo
                                            ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToWhoWeArePage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: Icon(MdiIcons.accountGroup,
                                            color: iconColorTwo,
                                          ),
                                          title: Text(aboutSchool,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColorTwo
                                            ),
                                          ),
                                          onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAboutSchoolDetailsPage(context);
                                          },
                                        ),
                                        ListTile(
                                            leading: Icon(MdiIcons.sortAlphabeticalAscending,
                                              color: iconColorTwo,
                                            ),
                                            title: Text(acronymMeanings,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColorTwo
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAcronymsMeaningsPage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: Icon(MdiIcons.opacity,
                                            color: iconColorTwo,
                                          ),
                                          title: Text(aboutApp,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColorTwo
                                            ),
                                          ),
                                          onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAboutAppDetailsPage(context);
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColorTwo),
                      onPressed: (){
                        showSearch(
                          context: context,
                          delegate: MyCaptainsSearch(all: captainsNotifier.captainsList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Center(
                        heightFactor: 0.6,
                        child: Text(thrownName,
                            style:  GoogleFonts.abel(
                              color: appBarTextColor,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      ),
                      background: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance.collection('SliversPages').doc('slivers_pages').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      snapshot.data?.data()!['slivers_page_4'],
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          );
                        },
                      )
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: const EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: captainsNotifier.captainsList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}
