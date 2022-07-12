import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import '../notifier/second_team_class_notifier.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String clubName = "AFC Binley FC";

String callFIRST = "tel:+44";
String smsFIRST = "sms:+44";
String whatsAppFIRST = "https://api.whatsapp.com/send?phone=+44";
String whatsAppSECOND = "&text=Hello%20";
String whatsAppTHIRD = ",%20How%20are%20you%20doing%20today?";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://facebook.com/";
String urlLinkedIn = "https://linkedin.com/";
String urlInstagram = "https://www.instagram.com/";
String urlSnapchat = "https://www.snapchat.com/add/";
String urlTikTok = "https://www.tiktok.com/@";

String reachDetails = "Contacts";
String autoBioDetails = "AutoBiography";

String callButton = "Call me";
String messageButton = "Send me a Message";
String whatsAppButton = "Send me a WhatsApp Message";
String emailButton = "Send me an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String facebookButton = "My Facebook";
String linkedInButton = "My LinkedIn";
String snapchatButton = "My Snapchat";
String tikTokButton = "My TikTok";

String autobiographyTitle = "My Autobiography\n";
String nicknameTitle = "My Nickname\n";
String bestMomentTitle = "My best moment so far in $clubName\n";
String worstMomentTitle = "My worst moment so far in $clubName\n";
String dreamFCTitle = "My Dream Football Club\n";
String positionPlayingTitle = "My Play Position\n";
String dobTitle = "My Date of Birth\n";
// String prefectPositionTitle = "Position held as a Prefect\n";
String regionOfOriginTitle = "My Region of Origin\n";
String countryTitle = "My Nationality\n";
String otherPositionsOfPlayTitle = "Other Positions I Can Play\n";
String favFootballLegendTitle = "My All Time Favourite Legend\n";
String yearOfInceptionTitle = "Inception with $clubName\n";
String leftOrRightFootedTitle = "Left or Right Footed\n";
String adidasOrNikeTitle = "Adidas or Nike\n";
String ronaldoOrMessiTitle = "Ronaldo or Messi\n";
String hobbiesTitle = "My Hobbies\n";
String philosophyTitle = "My Philosophy about Life\n";
String droplineTitle = "Dropline to My fellow $clubName footballers\n";


String facebookProfileSharedPreferencesTitle = "Manual Website Search";
String facebookProfileSharedPreferencesContentOne= "Apparently, you'd need to search manually for ";
String facebookProfileSharedPreferencesContentTwo = ", on Facebook.com";
String facebookProfileSharedPreferencesButton = "Go to Facebook";
String facebookProfileSharedPreferencesButtonTwo = "Lol, No";

String linkedInProfileSharedPreferencesTitle = "Manual Website Search";
String linkedInProfileSharedPreferencesContentOne= "Apparently, you'd need to search manually for ";
String linkedInProfileSharedPreferencesContentTwo = ", on LinkedIn.com";
String linkedInProfileSharedPreferencesButton = "Go to LinkedIn";
String linkedInProfileSharedPreferencesButtonTwo = "Lol, No";


Color backgroundColor = const Color.fromRGBO(143, 189, 211, 1);
Color appBarTextColor = const Color.fromRGBO(71, 69, 69, 1.0);
Color appBarBackgroundColor = const Color.fromRGBO(143, 189, 211, 1);
Color appBarIconColor = const Color.fromRGBO(71, 69, 69, 1.0);
Color materialBackgroundColor = Colors.transparent;
Color shapeDecorationColor = const Color.fromRGBO(143, 189, 211, 1);
Color shapeDecorationColorTwo = const Color.fromRGBO(143, 189, 211, 1);
Color shapeDecorationTextColor = const Color.fromRGBO(143, 189, 211, 1);
Color shapeDecorationIconColor = const Color.fromRGBO(143, 189, 211, 1);
Color cardBackgroundColor = const Color.fromRGBO(71, 69, 69, 1.0);
Color splashColor = Colors.white;
Color splashColorTwo = Colors.white;
Color splashColorThree = Colors.white;
Color iconTextColor = const Color.fromRGBO(71, 69, 69, 1.0);
Color iconTextColorTwo = const Color.fromRGBO(143, 189, 211, 1);
Color buttonColor = const Color.fromRGBO(143, 189, 211, 1);
Color textColor = const Color.fromRGBO(143, 189, 211, 1);
Color confettiColorOne = Colors.green;
Color confettiColorTwo = Colors.blue;
Color confettiColorThree = Colors.pink;
Color confettiColorFour = Colors.orange;
Color confettiColorFive = Colors.purple;
Color confettiColorSix = Colors.brown;
Color confettiColorSeven = Colors.white;
Color confettiColorEight = Colors.blueGrey;
Color confettiColorNine = Colors.redAccent;
Color confettiColorTen = Colors.teal;
Color confettiColorEleven = Colors.indigoAccent;
Color confettiColorTwelve = Colors.cyan;


late SecondTeamClassNotifier secondTeamClassNotifier;

Map<int, Widget>? userBIO;

dynamic _autoBio;
dynamic _bestMoment;
dynamic _dob;
dynamic _dreamFC;
dynamic _positionPlaying;
dynamic _email;
dynamic _facebook;
dynamic _linkedIn;
dynamic _hobbies;
dynamic _instagram;
dynamic _name;
dynamic _nickname;
dynamic _philosophy;
dynamic _phone;
dynamic _captain;
dynamic _myDropline;
// dynamic _prefectPosition;
dynamic _country;
dynamic _regionFrom;
dynamic _snapchat;
dynamic _tikTok;
dynamic _otherPositionsOfPlay;
dynamic _favFootballLegend;
dynamic _yearOfInception;
dynamic _leftOrRightFooted;
dynamic _adidasOrNike;
dynamic _ronaldoOrMessi;
dynamic _twitter;
dynamic _worstMoment;

class SecondTeamClassDetailsPage extends StatefulWidget {
  const SecondTeamClassDetailsPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SecondTeamClassDetailsPage> createState() => _SecondTeamClassDetailsPage();
}

class _SecondTeamClassDetailsPage extends State<SecondTeamClassDetailsPage> {
  ConfettiController? _confettiController;

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The required App not installed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    secondTeamClassNotifier = Provider.of<SecondTeamClassNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController!,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: [
        confettiColorOne,
        confettiColorTwo,
        confettiColorThree,
        confettiColorFour,
        confettiColorFive,
        confettiColorSix,
        confettiColorSeven,
        confettiColorEight,
        confettiColorNine,
        confettiColorTen,
        confettiColorEleven,
        confettiColorTwelve,
      ],
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            secondTeamClassNotifier.currentSecondTeamClass.nickname!,
            style: GoogleFonts.sanchez(
                color: appBarTextColor, fontSize: 25, fontWeight: FontWeight.w400),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 10,
          backgroundColor: appBarBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: appBarIconColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Tooltip(
                  message: secondTeamClassNotifier.currentSecondTeamClass.name,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: secondTeamClassNotifier.currentSecondTeamClass.image!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(MdiIcons.alertRhombus),
                      ),
                    ),
                  )),
              Material(
                color: materialBackgroundColor,
                child: InkWell(
                  splashColor: splashColor,
                  onTap: () {},
                  child: Card(
                    elevation: 4,
                    color: cardBackgroundColor,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: cardBackgroundColor.withOpacity(0.70),
                          width: 4.0,
                          style: BorderStyle.solid),
                    ),
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),

                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              secondTeamClassNotifier.currentSecondTeamClass.name!.toUpperCase(),
                              style: GoogleFonts.blinker(
                                  color: shapeDecorationTextColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                            (() {
                              if (secondTeamClassNotifier.currentSecondTeamClass.captain == "Yes") {
                                return
                                  Row(
                                    children: <Widget>[
                                      const SizedBox(width: 10),
                                      Icon (
                                        MdiIcons.shieldCheck,
                                        color: shapeDecorationIconColor,
                                      ),
                                    ],
                                  );
                              } else {
                                return Visibility(
                                  visible: !_isVisible,
                                  child: Icon (
                                    MdiIcons.shieldCheck,
                                    color: shapeDecorationIconColor,
                                  ),
                                );
                              }
                            }()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: cardBackgroundColor,
                margin: const EdgeInsets.all(10),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: CupertinoSlidingSegmentedControl<int>(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          thumbColor: cardBackgroundColor,
                          backgroundColor:
                          shapeDecorationColorTwo.withAlpha(50),
                          children: {
                            0: Text(
                              reachDetails,
                              style: GoogleFonts.sacramento(
                                  color: shapeDecorationColorTwo,
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            1: Text(
                              autoBioDetails,
                              style: GoogleFonts.sacramento(
                                color: shapeDecorationColorTwo,
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          },
                          onValueChanged: (int? val) {
                            setState(() {
                              sharedValue = val!;
                            });
                          },
                          groupValue: sharedValue,
                        ),
                      ),
                      userBIO![sharedValue]!,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  initState() {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController!.play();

    SecondTeamClassNotifier secondTeamClassNotifier = Provider.of<SecondTeamClassNotifier>(context, listen: false);

    _autoBio = secondTeamClassNotifier.currentSecondTeamClass.autoBio;
    _bestMoment = secondTeamClassNotifier.currentSecondTeamClass.bestMoment;
    _dob = secondTeamClassNotifier.currentSecondTeamClass.dob;
    _dreamFC = secondTeamClassNotifier.currentSecondTeamClass.dreamFC;
    _positionPlaying = secondTeamClassNotifier.currentSecondTeamClass.positionPlaying;
    _email = secondTeamClassNotifier.currentSecondTeamClass.email;
    _facebook = secondTeamClassNotifier.currentSecondTeamClass.facebook;
    _linkedIn = secondTeamClassNotifier.currentSecondTeamClass.linkedIn;
    _hobbies = secondTeamClassNotifier.currentSecondTeamClass.hobbies;
    _instagram = secondTeamClassNotifier.currentSecondTeamClass.instagram;
    _myDropline = secondTeamClassNotifier.currentSecondTeamClass.myDropline;
    _name = secondTeamClassNotifier.currentSecondTeamClass.name;
    _nickname = secondTeamClassNotifier.currentSecondTeamClass.nickname;
    _philosophy = secondTeamClassNotifier.currentSecondTeamClass.philosophy;
    _phone = secondTeamClassNotifier.currentSecondTeamClass.phone;
    _captain = secondTeamClassNotifier.currentSecondTeamClass.captain;
    // _prefectPosition = secondTeamClassNotifier.currentSecondTeamClass.positionEnforced;
    _country = secondTeamClassNotifier.currentSecondTeamClass.constituentCountry;
    _regionFrom = secondTeamClassNotifier.currentSecondTeamClass.regionFrom;
    _twitter = secondTeamClassNotifier.currentSecondTeamClass.twitter;
    _snapchat = secondTeamClassNotifier.currentSecondTeamClass.snapchat;
    _tikTok = secondTeamClassNotifier.currentSecondTeamClass.tikTok;
    _otherPositionsOfPlay = secondTeamClassNotifier.currentSecondTeamClass.otherPositionsOfPlay;
    _favFootballLegend = secondTeamClassNotifier.currentSecondTeamClass.favFootballLegend;
    _yearOfInception = secondTeamClassNotifier.currentSecondTeamClass.yearOfInception;
    _leftOrRightFooted = secondTeamClassNotifier.currentSecondTeamClass.leftOrRightFooted;
    _adidasOrNike = secondTeamClassNotifier.currentSecondTeamClass.adidasOrNike;
    _ronaldoOrMessi = secondTeamClassNotifier.currentSecondTeamClass.ronaldoOrMessi;
    _worstMoment = secondTeamClassNotifier.currentSecondTeamClass.worstMoment;

    userBIO = <int, Widget>{
      0: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (() {
            if (_phone.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.dialpad,
                      color: iconTextColor,
                    ),
                    label: Text(callButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_phone.toString().startsWith('0')) {
                        var most = _phone.toString().substring(1);
                        launchURL(callFIRST +most);
                      }
                      else {
                        launchURL(callFIRST + _phone);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: Icon(
                        MdiIcons.dialpad,
                        color: iconTextColor,
                      ),
                      label: Text(callButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(callFIRST + _phone);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_phone.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.message,
                      color: iconTextColor,
                    ),
                    label: Text(messageButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_phone.toString().startsWith('0')) {
                        var most = _phone.toString().substring(1);
                        launchURL(smsFIRST +most);
                      }
                      else {
                        launchURL(smsFIRST + _phone);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: Icon(
                        MdiIcons.message,
                        color: iconTextColor,
                      ),
                      label: Text(messageButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(smsFIRST + _phone);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_phone.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.whatsapp,
                      color: iconTextColor,
                    ),
                    label: Text(whatsAppButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_phone.toString().startsWith('0')) {
                        var most = _phone.toString().substring(1);
                        var firstName = _name.toString().substring(0, _name.toString().indexOf(" "));
                        launchURL(whatsAppFIRST + most + whatsAppSECOND + firstName + whatsAppTHIRD);
                      }
                      else {
                        var firstName = _name.toString().substring(0, _name.toString().indexOf(" "));
                        launchURL(whatsAppFIRST + _phone + whatsAppSECOND + firstName + whatsAppTHIRD);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: Icon(
                        MdiIcons.message,
                        color: iconTextColor,
                      ),
                      label: Text(whatsAppButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(smsFIRST + _phone);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_email.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.gmail,
                      color: iconTextColor,
                    ),
                    label: Text(emailButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      launchURL(mailFIRST + _email + mailSECOND + _name);
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: Icon(
                          MdiIcons.gmail,
                          color: iconTextColor,
                        ),
                        label: Text(emailButton,
                            style: GoogleFonts.abel(
                                color: iconTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(mailFIRST + _email + mailSECOND + _name);
                        },
                      ),
                    ),
                  ));
            }
          }()),

          (() {
            if (_twitter.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(MdiIcons.twitter, color: iconTextColor),
                    label: Text(twitterButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        )
                    ),
                    onPressed: () {
                      if (_twitter.toString().startsWith('@')) {
                        var most = _twitter.toString().substring(1);
                        launchURL(urlTwitter + most);
                      }
                      else {
                        launchURL(urlTwitter + _twitter);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      elevation: 2,
                      color: buttonColor,
                      icon: Icon(MdiIcons.twitter, color: iconTextColor),
                      label: Text(twitterButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      onPressed: () {
                        launchURL(urlTwitter+_twitter);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_instagram.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.instagram,
                      color: iconTextColor,
                    ),
                    label: Text(instagramButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_instagram.toString().startsWith('@')) {
                        var most = _instagram.toString().substring(1);
                        launchURL(urlInstagram + most);
                      }
                      else {
                        launchURL(urlInstagram + _instagram);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: Icon(
                          MdiIcons.instagram,
                          color: iconTextColor,
                        ),
                        label: Text(instagramButton,
                            style: GoogleFonts.abel(
                                color: iconTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w300)),
                        onPressed: () {
                          launchURL(urlInstagram + _instagram);
                        },
                      ),
                    ),
                  ));
            }
          }()),

          (() {
            if (_snapchat.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.snapchat,
                      color: iconTextColor,
                    ),
                    label: Text(snapchatButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_snapchat.toString().startsWith('@')) {
                        var most = _instagram.toString().substring(1);
                        launchURL(urlSnapchat + most);
                      }
                      else {
                        launchURL(urlSnapchat + _snapchat);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: Icon(
                        MdiIcons.snapchat,
                        color: iconTextColorTwo,
                      ),
                      label: Text(snapchatButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(urlSnapchat + _snapchat);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_tikTok.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: FaIcon(
                      FontAwesomeIcons.tiktok,
                      color: iconTextColor,
                    ),
                    label: Text(tikTokButton,
                        style: GoogleFonts.abel(
                            color: iconTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    onPressed: () {
                      if (_tikTok.toString().startsWith('@')) {
                        var most = _tikTok.toString().substring(1);
                        launchURL(urlTikTok + most);
                      }
                      else {
                        launchURL(urlTikTok + _tikTok);
                      }
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                visible: !_isVisible,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: splashColorTwo,
                    child: RaisedButton.icon(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 2,
                      color: buttonColor,
                      icon: FaIcon(
                        FontAwesomeIcons.tiktok,
                        color: iconTextColorTwo,
                      ),
                      label: Text(tikTokButton,
                          style: GoogleFonts.abel(
                              color: iconTextColorTwo,
                              fontSize: 18,
                              fontWeight: FontWeight.w300)),
                      onPressed: () {
                        launchURL(urlTikTok + _tikTok);
                      },
                    ),
                  ),
                ),
              );
            }
          }()),

          (() {
            if (_facebook.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.facebook,
                      color: iconTextColor,
                    ),
                    label: Text(
                      facebookButton,
                      style: GoogleFonts.abel(
                          color: iconTextColor,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      facebookLink();
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: Icon(
                          MdiIcons.facebook,
                          color: iconTextColor,
                        ),
                        label: Text(
                          facebookButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          launchURL(urlFacebook + _facebook);
                        },
                      ),
                    ),
                  ));
            }
          }()),

          (() {
            if (_linkedIn.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  splashColor: splashColorTwo,
                  child: RaisedButton.icon(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    color: buttonColor,
                    icon: Icon(
                      MdiIcons.linkedin,
                      color: iconTextColor,
                    ),
                    label: Text(
                      linkedInButton,
                      style: GoogleFonts.abel(
                          color: iconTextColor,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      linkedInLink();
                    },
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      splashColor: splashColorTwo,
                      child: RaisedButton.icon(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                        color: buttonColor,
                        icon: Icon(
                          MdiIcons.facebook,
                          color: iconTextColor,
                        ),
                        label: Text(
                          facebookButton,
                          style: GoogleFonts.abel(
                              color: iconTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300),
                        ),
                        onPressed: () {
                          launchURL(urlFacebook + _facebook);
                        },
                      ),
                    ),
                  ));
            }
          }()),


        ],
      ),

      1: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          (() {
            if (_autoBio.toString().isNotEmpty) {
              return Container(
                decoration: BoxDecoration(
                    color: shapeDecorationColorTwo.withAlpha(50),
                    borderRadius: BorderRadius.circular(10)),
                child: Material(
                  color: materialBackgroundColor,
                  child: InkWell(
                    splashColor: splashColorThree,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: autobiographyTitle,
                                style: GoogleFonts.aBeeZee(
                                  color: textColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: ' ' + _autoBio,
                                style: GoogleFonts.trykker(
                                  color: textColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w300,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Container(
                    decoration: BoxDecoration(
                        color: shapeDecorationColorTwo.withAlpha(50),
                        borderRadius: BorderRadius.circular(10)),
                    child: Material(
                      color: materialBackgroundColor,
                      child: InkWell(
                        splashColor: splashColorThree,
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                          child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: autobiographyTitle,
                                    style: GoogleFonts.aBeeZee(
                                      color: textColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: ' ' + _autoBio,
                                    style: GoogleFonts.trykker(
                                      color: textColor,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w300,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ));
            }
          }()),

          (() {
            if (_nickname.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: nicknameTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _nickname,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: nicknameTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _nickname,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_bestMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: bestMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _bestMoment,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: bestMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _bestMoment,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_worstMoment.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: worstMomentTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _worstMoment,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: worstMomentTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _worstMoment,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          // (() {
          //   if (_captain.toString() == "Yes") {
          //     return Padding(
          //       padding: const EdgeInsets.only(top: 20.0),
          //       child: Container(
          //         child: Material(
          //           color: materialBackgroundColor,
          //           child: InkWell(
          //             splashColor: splashColorThree,
          //             onTap: () {},
          //             child: Padding(
          //               padding:
          //               const EdgeInsets.only(bottom: 15, top: 15, left: 25),
          //               child: Text.rich(
          //                 TextSpan(
          //                   children: <TextSpan>[
          //                     TextSpan(
          //                         text: prefectPositionTitle,
          //                         style: GoogleFonts.aBeeZee(
          //                           color: textColor,
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.bold,
          //                         )),
          //                     TextSpan(
          //                         text: ' ' + _prefectPosition,
          //                         style: GoogleFonts.trykker(
          //                           color: textColor,
          //                           fontSize: 19,
          //                           fontWeight: FontWeight.w300,
          //                         )),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         decoration: BoxDecoration(
          //             color: shapeDecorationColorTwo.withAlpha(50),
          //             borderRadius: new BorderRadius.circular(10)),
          //       ),
          //     );
          //   } else {
          //     return Visibility(
          //         visible: !_isVisible,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 20.0),
          //           child: Container(
          //             child: Material(
          //               color: materialBackgroundColor,
          //               child: InkWell(
          //                 splashColor: splashColorThree,
          //                 onTap: () {},
          //                 child: Padding(
          //                   padding:
          //                   const EdgeInsets.only(bottom: 15, top: 15, left: 25),
          //                   child: Text.rich(
          //                     TextSpan(
          //                       children: <TextSpan>[
          //                         TextSpan(
          //                             text: prefectPositionTitle,
          //                             style: GoogleFonts.aBeeZee(
          //                               color: textColor,
          //                               fontSize: 19,
          //                               fontWeight: FontWeight.bold,
          //                             )),
          //                         TextSpan(
          //                             text: ' ' + _prefectPosition,
          //                             style: GoogleFonts.trykker(
          //                               color: textColor,
          //                               fontSize: 19,
          //                               fontWeight: FontWeight.w300,
          //                             )),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             decoration: BoxDecoration(
          //                 color: shapeDecorationColorTwo.withAlpha(50),
          //                 borderRadius: new BorderRadius.circular(10)),
          //           ),
          //         )
          //     );
          //   }
          // }()),

          (() {
            if (_yearOfInception.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: yearOfInceptionTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _yearOfInception,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: chosenSubjectsTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _chosenSubjects,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_ronaldoOrMessi.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: ronaldoOrMessiTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _ronaldoOrMessi,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: favClassmateTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _favClassmate,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_adidasOrNike.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: adidasOrNikeTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _adidasOrNike,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: favSchoolActivityTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _favSchoolActivity,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_leftOrRightFooted.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: leftOrRightFootedTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _leftOrRightFooted,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: favPlaceInCampusTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _favPlaceInCampus,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_favFootballLegend.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: favFootballLegendTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _favFootballLegend,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: favSportInCampusTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _favSportInCampus,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_otherPositionsOfPlay.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: otherPositionsOfPlayTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _otherPositionsOfPlay,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: favWatchedMovieTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _favWatchedMovie,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_dreamFC.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dreamFCTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dreamFC,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: dreamUniversityTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _dreamUniversity,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_positionPlaying.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: positionPlayingTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _positionPlaying,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        // child: InkWell(
                        //   splashColor: splashColorThree,
                        //   onTap: () {},
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        //     child: Text.rich(
                        //       TextSpan(
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //               text: dreamUniversityCourseTitle,
                        //               style: GoogleFonts.aBeeZee(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.bold,
                        //               )),
                        //           TextSpan(
                        //               text: ' ' + _dreamUniversityCourse,
                        //               style: GoogleFonts.trykker(
                        //                 color: textColor,
                        //                 fontSize: 19,
                        //                 fontWeight: FontWeight.w300,
                        //               )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_dob.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: dobTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _dob,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: dobTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _dob,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_regionFrom.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: regionOfOriginTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _regionFrom,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: regionOfOriginTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _regionFrom,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_country.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: countryTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _country,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: countryTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _country,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_hobbies.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: hobbiesTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _hobbies,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: hobbiesTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _hobbies,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_philosophy.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: philosophyTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _philosophy,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: philosophyTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _philosophy,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),

          (() {
            if (_myDropline.toString().isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: shapeDecorationColorTwo.withAlpha(50),
                      borderRadius: BorderRadius.circular(10)),
                  child: Material(
                    color: materialBackgroundColor,
                    child: InkWell(
                      splashColor: splashColorThree,
                      onTap: () {},
                      child: Padding(
                        padding:
                        const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: droplineTitle,
                                  style: GoogleFonts.aBeeZee(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                  text: ' ' + _myDropline,
                                  style: GoogleFonts.trykker(
                                    color: textColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Visibility(
                  visible: !_isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: shapeDecorationColorTwo.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      child: Material(
                        color: materialBackgroundColor,
                        child: InkWell(
                          splashColor: splashColorThree,
                          onTap: () {},
                          child: Padding(
                            padding:
                            const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: droplineTitle,
                                      style: GoogleFonts.aBeeZee(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  TextSpan(
                                      text: ' ' + _myDropline,
                                      style: GoogleFonts.trykker(
                                        color: textColor,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          }()),


        ],
      ),
    };
    super.initState();
  }

  int sharedValue = 0;

  facebookLink() async {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: backgroundColor,
        title: Text(
          facebookProfileSharedPreferencesTitle,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        content: Text(
          facebookProfileSharedPreferencesContentOne + _facebook + facebookProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              launchURL(urlFacebook);
              Toast.show("Loading up Facebook.com",
                  duration: Toast.lengthLong,
                  gravity:  Toast.bottom,
                  webTexColor: cardBackgroundColor,
                  backgroundColor: backgroundColor,
                  backgroundRadius: 10
              );
            },
            child: Text(facebookProfileSharedPreferencesButton,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(facebookProfileSharedPreferencesButtonTwo,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),

        ],
      ),
    );
//    }
  }

  linkedInLink() async {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: backgroundColor,
        title: Text(
          linkedInProfileSharedPreferencesTitle,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        content: Text(
          linkedInProfileSharedPreferencesContentOne + _linkedIn + linkedInProfileSharedPreferencesContentTwo,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: cardBackgroundColor
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              launchURL(urlLinkedIn);
              Toast.show("Loading up LinkedIn.com",
                  duration:
                  Toast.lengthLong,
                  gravity:  Toast.bottom,
                  webTexColor: cardBackgroundColor,
                  backgroundColor: backgroundColor,
                  backgroundRadius: 10
              );
            },
            child: Text(linkedInProfileSharedPreferencesButton,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(linkedInProfileSharedPreferencesButtonTwo,
              style: TextStyle(
                  color: cardBackgroundColor
              ),
            ),
          ),

        ],
      ),
    );
//    }
  }


  @override
  void dispose() {
    _confettiController!.dispose();
    super.dispose();
  }

}
