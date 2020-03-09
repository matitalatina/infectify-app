import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WebView(
      initialUrl: 'http://arcg.is/081a51',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
