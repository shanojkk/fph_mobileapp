import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ValueWidgetBuilder<T> = Widget Function(T);

class ConnectivityViewModel extends ChangeNotifier {
  bool hasConnection = true;

  void registerNetworkListener() {
    Connectivity().onConnectivityChanged.listen((event) {
      hasConnection =
          event == ConnectivityResult.mobile || event == ConnectivityResult.wifi;
      notifyListeners();
    });
  }
}

class ConnectivityWrapper extends StatelessWidget {
  const ConnectivityWrapper({required this.builder, super.key});

  final ValueWidgetBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    // registering network stream listener
    Provider.of<ConnectivityViewModel>(context, listen: false).registerNetworkListener();

    return Selector<ConnectivityViewModel, bool>(
      builder: (context, value, child) => builder(value),
      selector: (context, viewModel) => viewModel.hasConnection,
    );
  }
}
