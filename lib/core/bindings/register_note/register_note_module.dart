import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/data.dart';
import '../../../features/domain/domain.dart';
import '../../../features/presentation/presentation.dart';

class RegisterNoteModule extends Module {
  @override
  void binds(Injector i) {
    /// DataSources injections.
    i.add<CreateNoteDataSource>(
      () => CreateNoteDataSourceImpl(
        firebaseFirestore: i.get<FirebaseFirestore>(),
      ),
    );

    /// Repositories injections.
    i.add<CreateNoteRepository>(
      () => CreateNoteRepositoryImpl(
        createNoteDataSource: i.get<CreateNoteDataSource>(),
      ),
    );

    /// UseCases injections.
    i.add<CreateNoteUseCase>(
      () => CreateNoteUseCaseImpl(
        createNoteRepository: i.get<CreateNoteRepository>(),
      ),
    );

    /// Stores Injections.
    i.add<RegisterNoteState>(
      () => RegisterNoteState(
        createNoteUseCase: i.get<CreateNoteUseCase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterNotePage());
  }
}
