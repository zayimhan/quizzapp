import 'package:cloud_firestore/cloud_firestore.dart';

class TeamsDaoRepository{

  var collectionTeams = FirebaseFirestore.instance.collection("teams");

}