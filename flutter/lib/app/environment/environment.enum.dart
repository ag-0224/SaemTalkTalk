import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:saem_talk_talk/app/environment/firebase/firebase_options.dart'
    as prod_firebase;
import 'package:saem_talk_talk/app/environment/firebase/firebase_options_dev.dart'
    as dev_firebase;

enum Environment {
  dev(type: "DEV"),
  prod(type: "PROD");

  final String type;

  const Environment({
    required this.type,
  });

  String get dotFileName => switch (this) {
        dev => /*'.dev.env'*/ '.env',
        prod => '.env',
      };

  String get firebaseId => switch (this) {
        dev => dotenv.env['FIREBASE_DEV_ID']!,
        prod => dotenv.env['FIREBASE_PROD_ID']!,
      };

  FirebaseOptions get firebaseOption => switch (this) {
        dev => dev_firebase.DefaultFirebaseOptions.currentPlatform,
        prod => prod_firebase.DefaultFirebaseOptions.currentPlatform,
      };
}
