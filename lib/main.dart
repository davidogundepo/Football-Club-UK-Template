import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uk_club_template/sidebar/sidebar_layout.dart';
import 'api/PushNotificationService.dart';
import 'notifier/achievement_images_notifier.dart';
import 'notifier/club_arial_notifier.dart';
import 'notifier/club_captains_notifier.dart';
import 'notifier/coaching_staff_notifier.dart';
import 'notifier/first_team_class_notifier.dart';
import 'notifier/management_body_notifier.dart';
import 'notifier/second_team_class_notifier.dart';
import 'notifier/sidebar_notifier.dart';
import 'notifier/third_team_class_notifier.dart';
import '../notifier/coaches_reviews_comment_notifier.dart';
import '../notifier/founders_reviews_comment_notifier.dart';
import './notifier/cum_motm_players_stats_info_notifier.dart';
import './notifier/motm_players_stats_info_notifier.dart';
import './notifier/top_defensive_players_stats_info_notifier.dart';
import './notifier/top_gk_players_stats_info_notifier.dart';
import './notifier/player_of_the_month_stats_info_notifier.dart';
import './notifier/most_assists_players_stats_info_notifier.dart';
import './notifier/most_fouled_yc_players_stats_info_notifier.dart';
import './notifier/most_fouled_rc_players_stats_info_notifier.dart';
import './notifier/top_goals_players_stats_info_notifier.dart';
import './notifier/trainings_games_reels_notifier.dart';

Color? backgroundColor = Colors.indigo[400];
Color? appBarIconColor = Colors.indigo[200];
Color? appBarBackgroundColor = Colors.indigo[400];
Color? secondStudentChartColor = Colors.indigo[400];


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationService().setupInteractedMessage();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() async {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FirstTeamClassNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SecondTeamClassNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThirdTeamClassNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CaptainsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CoachesNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ManagementBodyNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => ClubArialNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => AchievementsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => SideBarNotifier(),
          ),

          ChangeNotifierProvider(
            create: (context) => MostAssistsPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MostFouledYCPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MostFouledRCPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopGoalsPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopGKPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopDefensivePlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MOTMPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CumMOTMPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainingsAndGamesReelsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlayerOfTheMonthStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CoachesReviewsCommentNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoundersReviewsCommentNotifier(),
          ),
        ],
        child: const MyApp()
    ));
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      // App received a notification when it was killed
    }
  }, FirebaseCrashlytics.instance.recordError);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      if (kDebugMode) {
        print("completed");
      }
      setState(() {});
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SideBarLayout(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }

}