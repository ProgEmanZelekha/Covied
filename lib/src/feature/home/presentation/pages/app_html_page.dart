import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppHtmlPage extends StatefulWidget {
  AppHtmlPage({Key? key, required this.url}) : super(key: key);
  bool isLoading = true;
  final String url;

  var controller = WebViewController();

  @override
  State<AppHtmlPage> createState() => _AppHtmlPageState();
}

class _AppHtmlPageState extends State<AppHtmlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.current.primaryColor,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
              ),
              child: WebViewWidget(controller: widget.controller)),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..clearCache()
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress > 70) {
              if (widget.isLoading) {
                setState(() {
                  widget.isLoading = false;
                });
              }
            } else if (progress <= 10) {
              if (widget.isLoading){
                setState(() {
                  widget.isLoading = true;
                });}
            }
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }
}
