import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DosPage extends StatefulWidget {
  const DosPage({Key? key}) : super(key: key);

  @override
  State<DosPage> createState() => _DosPageState();
}

class _DosPageState extends State<DosPage> {
  int position = 1 ;
  String url = "flutter.dev";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Titulo al Centro'),
          centerTitle: true,
        ),
        body: IndexedStack(
            index: position,
            children: [
              WebView(
                initialUrl: "https://$url",
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
                        Text("Cargando $url")
                      ],
                    )
                ),
              ),
            ]
        )
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

