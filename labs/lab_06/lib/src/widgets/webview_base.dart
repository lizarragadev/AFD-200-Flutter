import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBase extends StatefulWidget {
  final url;
  const WebViewBase(String this.url);

  @override
  State<WebViewBase> createState() => _WebViewBaseState();
}

class _WebViewBaseState extends State<WebViewBase> {
  int position = 1 ;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
        index: position,
        children: [
          WebView(
            initialUrl: "https://${widget.url.toString()}",
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: _doneLoading,
            onPageStarted: _startLoading,
          ),
          Container(
            color: Colors.white,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20,),
                    Text("Cargando ${widget.url}")
                  ],
                )
            ),
          ),
        ]
    );
  }

  _doneLoading(String value) {
    setState(() {
      position = 0;
    });
  }

  _startLoading(String value){
    setState(() {
      position = 1;
    });
  }
}
