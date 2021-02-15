import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://www.example.com',
      // ignore: missing_return
      navigationDelegate: (NavigationRequest request) {
        if(request.url.contains("mailto:")) {
          launch(request.url);
          return NavigationDecision.prevent;
        }
        else if (request.url.contains("tel:")) {
          launch(request.url);
          return NavigationDecision.prevent;
        }
      },
    );

  }
}
