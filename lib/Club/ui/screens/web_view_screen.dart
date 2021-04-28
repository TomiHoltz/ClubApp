import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({@required this.url});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(url: url, appBar: AppBar(title: Text(url), backgroundColor: Colors.grey,));
  }
}