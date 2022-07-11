class FirstTeamClass {
  String? autoBio;
  String? bestMoment;
  String? dob;
  String? dreamFC;
  String? positionPlaying;
  String? email;
  String? facebook;
  String? hobbies;
  String? id;
  String? image;
  String? instagram;
  String? myDropline;
  String? name;
  String? nickname;
  String? philosophy;
  String? teamCaptaining;
  String? phone;
  String? captain;
  String? constituentCountry;
  String? regionFrom;
  String? snapchat;
  String? tikTok;
  String? linkedIn;
  String? otherPositionsOfPlay;
  String? favFootballLegend;
  String? yearOfInception;
  String? adidasOrNike;
  String? ronaldoOrMessi;
  String? leftOrRightFooted;
  String? twitter;
  String? worstMoment;

  FirstTeamClass.fromMap(Map<String?, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    teamCaptaining = data['team_captaining'];
    captain = data['captain'];
    constituentCountry = data['constituent_country'];
    regionFrom = data['region_from'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    dreamFC = data['dream_fc'];
    positionPlaying = data['position_playing'];
    snapchat = data['snapchat'];
    tikTok = data['tiktok'];
    linkedIn = data['linkedIn'];
    otherPositionsOfPlay = data['other_positions_of_play'];
    favFootballLegend = data['fav_football_legend'];
    yearOfInception = data['year_of_inception'];
    adidasOrNike = data['adidas_or_nike'];
    ronaldoOrMessi = data['ronaldo_or_messi'];
    leftOrRightFooted = data['left_or_right'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
  }

}