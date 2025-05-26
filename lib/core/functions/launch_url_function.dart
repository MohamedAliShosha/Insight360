// This function has the context as a parameter as we may need to use it to show something that depends on "context" as we used the SnackBar
import 'package:news_app/core/functions/snack_bar_function.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showSnackBar(
        context,
        message: 'Cannot launch $url',
      );
    }
  }
}
