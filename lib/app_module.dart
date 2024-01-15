import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    /// External Dependencies.
    i.addSingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      "/",
      module: HomeModule(),
    );
  }
}
