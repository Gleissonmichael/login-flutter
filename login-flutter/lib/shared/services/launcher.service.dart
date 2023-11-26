import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  void launch(String url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
