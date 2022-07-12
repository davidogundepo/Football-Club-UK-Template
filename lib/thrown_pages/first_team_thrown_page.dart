import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../bottom_nav_stats_pages/bottom_navigator.dart';
import '../thrown_searches/first_team_thrown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_club.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/first_team_class_api.dart';
import '../notifier/first_team_class_notifier.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/first_team_details_page.dart';


String clubName = "AFC Binley FC";
String postcode = "CV1 3WQ";
String city = "Coventry";
String stateName = "West Midlands";
String countryName = "The UK";
String thrownName = "First Team Players";

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

String networkSharedPreferencesKey = "first_time";
String networkSharedPreferencesTitle = "Network";
String networkSharedPreferencesContent = "The internet connection is required for the first time launch, please leave on for few seconds :)";
String networkSharedPreferencesButton = "Okies";


String appOverviewSharedPreferencesKey = "overview_time";
String appOverviewSharedPreferencesTitle = "APP OVERVIEW";
String appOverviewSharedPreferencesContentOne = "This Yearbook App was developed for $clubName, a Secondary School in $postcode, $city, $stateName. $countryName.\n";
String appOverviewSharedPreferencesContentTwo = "Our vision is to raise the total youth through comprehensive education.\n";
String appOverviewSharedPreferencesContentThree = "Welcome to our inventory, do read through and know more!";
String appOverviewSharedPreferencesButton = "Awesome";


Color backgroundColor = const Color.fromRGBO(26, 101, 109, 1.0);
Color appBarTextColor = const Color.fromRGBO(102, 159, 165, 1.0);
Color appBarBackgroundColor = const Color.fromRGBO(26, 101, 109, 1.0);
Color appBarIconColor = const Color.fromRGBO(102, 159, 165, 1.0);
Color modalColor = Colors.transparent;
Color modalBackgroundColor = const Color.fromRGBO(26, 101, 109, 1.0);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = const Color.fromRGBO(102, 159, 165, 1.0);
Color splashColor = const Color.fromRGBO(26, 101, 109, 1.0);
Color iconColor = const Color.fromRGBO(102, 159, 165, 1.0);
Color textColor = const Color.fromRGBO(102, 159, 165, 1.0);
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = const Color.fromRGBO(26, 101, 109, 1.0);
Color borderColor = Colors.black;


class MyFirstTeamClassPage extends StatefulWidget with NavigationStates{
  MyFirstTeamClassPage({Key? key, this.title}) : super(key: key);

  final String? title;




  @override
  State<MyFirstTeamClassPage> createState() => _MyFirstTeamClassPage();


}

class _MyFirstTeamClassPage extends State<MyFirstTeamClassPage> {

  late String? documentId;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  Widget _buildProductItem(BuildContext context, int index) {
    FirstTeamClassNotifier firstTeamClassNotifier = Provider.of<FirstTeamClassNotifier>(context);
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
              firstTeamClassNotifier.currentFirstTeamClass = firstTeamClassNotifier.firstTeamClassList[index];
              navigateToSubPage(context);
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
                                firstTeamClassNotifier.firstTeamClassList[index].image!
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
                                  firstTeamClassNotifier.firstTeamClassList[index].name!,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (firstTeamClassNotifier.firstTeamClassList[index].captain == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        const SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.shieldCheck,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.shieldCheck,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            // firstTeamClassNotifier.firstTeamClassList[index].twitter == firstTeamClassNotifier.firstTeamClassList[index].twitter ? '@'+firstTeamClassNotifier.firstTeamClassList[index].twitter : firstTeamClassNotifier.firstTeamClassList[index].twitter,
                              firstTeamClassNotifier.firstTeamClassList[index].positionPlaying!,
                              // == firstTeamClassNotifier.firstTeamClassList[index].twitter ? '@'+firstTeamClassNotifier.firstTeamClassList[index].twitter : firstTeamClassNotifier.firstTeamClassList[index].twitter,
                              style: GoogleFonts.varela(
                                  color: textColorTwo,
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
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          TextButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SubPage()));
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

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');

    if (firstTime != null && !firstTime) {
      // Not first time
    } else {
      // First time
      prefs.setBool(networkSharedPreferencesKey, false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),

          ),
          backgroundColor: dialogBackgroundColor,
          title: Text(networkSharedPreferencesTitle,
            style: TextStyle(
                color: textColor
            ),
          ),
          content: Text(networkSharedPreferencesContent,
            style: TextStyle(
                color: textColor
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(networkSharedPreferencesButton,
                style: TextStyle(
                    color: textColor
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  aboutAppWelcomeDialog() async {
    SharedPreferences appOverviewPrefs = await SharedPreferences.getInstance();
    bool? appOverviewChecked = appOverviewPrefs.getBool('overview_time');

    if (appOverviewChecked != null && !appOverviewChecked) {
      // Not first time
    }
    else {
      // First time
    appOverviewPrefs.setBool(appOverviewSharedPreferencesKey, false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(
          appOverviewSharedPreferencesTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: SizedBox(
          height: 220,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Text(
                  appOverviewSharedPreferencesContentOne,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
                Text(
                  appOverviewSharedPreferencesContentTwo,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
                Text(
                  appOverviewSharedPreferencesContentThree,
                  style: TextStyle(
                      color: textColor
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(appOverviewSharedPreferencesButton,
              style: TextStyle(
                  color: textColor
              ),
            ),
          )
        ],
      ),
    );
    }
  }

  @override
  void initState() {
    FirstTeamClassNotifier firstTeamClassNotifier = Provider.of<FirstTeamClassNotifier>(context, listen: false);
    getFirstTeamClass(firstTeamClassNotifier);

    startTime();

    aboutAppWelcomeDialog();

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    FirstTeamClassNotifier firstTeamClassNotifier = Provider.of<FirstTeamClassNotifier>(context);

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
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor
                      ),
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
                                  splashColor: splashColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 35.0, right: 8.0, left: 8.0),
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                            leading: Icon(MdiIcons.tableMultiple,
                                              color: iconColor,
                                            ),
                                            title: Text(tablesAndStats,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColor
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateTablesAndStatsDetails(context);
                                            }
                                        ),
                                        ListTile(
                                            leading: Icon(
                                              MdiIcons.atom,
                                              color: iconColor),
                                            title: Text(whoWeAre,
                                              style: GoogleFonts.zillaSlab(
                                                color: textColor,
                                              ),),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToWhoWeArePage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: Icon(MdiIcons.accountGroup, color: iconColor),
                                          title: Text(aboutSchool,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColor,
                                            ),),
                                          onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAboutSchoolDetailsPage(context);
                                          },
                                        ),
                                        ListTile(
                                            leading: Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                            title: Text(acronymMeanings,
                                              style: GoogleFonts.zillaSlab(
                                                color: textColor,
                                              ),),
                                            onTap: () {
                                              Navigator.of(context).pop(false);
                                              navigateToAcronymsMeaningsPage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: Icon(MdiIcons.opacity, color: iconColor),
                                          title: Text(aboutApp,
                                            style: GoogleFonts.zillaSlab(
                                              color: textColor,
                                            ),),
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
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: (){
                        showSearch(
                          context: context,
                          delegate: MyFirstTeamClassSearch(all: firstTeamClassNotifier.firstTeamClassList),
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
                            textAlign: TextAlign.center,
                            style: GoogleFonts.abel(
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
                                    snapshot.data?.data()!['slivers_page_1'],
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
                  itemCount: firstTeamClassNotifier.firstTeamClassList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
