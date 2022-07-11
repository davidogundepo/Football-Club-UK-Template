class Captains {
  String? teamCaptaining;
  String? image;
  String? name;
  String? id;

  Captains.fromMap(Map<String?, dynamic> data) {
    id = data['id'];
    image = data['image'];
    teamCaptaining = data['team_captaining'];
    name = data['name'];
  }

}