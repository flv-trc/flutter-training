import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_training/widgets/buttons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({super.key, required this.url, required this.title});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isOnline = true;
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    _checkInternetAndLoad();
  }

  Future<void> _checkInternetAndLoad() async {
    setState(() => _isChecking = true);

    try {
      final result = await InternetAddress.lookup(
        'example.com',
      ).timeout(const Duration(seconds: 3));
      _isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      _isOnline = false;
    }

    if (_isOnline) {
      await _controller.loadRequest(Uri.parse(widget.url));
    }

    setState(() => _isChecking = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isChecking) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }

    return _isOnline
        ? Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: WebViewWidget(controller: _controller),
          )
        : _OfflineScreen(onRetry: _checkInternetAndLoad);
  }
}

class _OfflineScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const _OfflineScreen({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "CONNECTION ERROR",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Sorry, we are unable to load this content. Please refresh or try again later.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: flatBlackButton(label: 'Retry', onPressed: onRetry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
