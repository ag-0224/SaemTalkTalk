import 'package:saem_talk_talk/app/environment/environment.enum.dart';
import 'package:saem_talk_talk/presentation/app.dart';
import 'package:saem_talk_talk/app/environment/flavor.dart';

Future<void> main() async {
  Flavor.initialize(Environment.prod);

  return runFlavoredApp();
}
