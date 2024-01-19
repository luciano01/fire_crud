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
    i.add<UpdateNoteDataSource>(
      () => UpdateNoteDataSourceImpl(
        firebaseFirestore: i.get<FirebaseFirestore>(),
      ),
    );
    i.add<DeleteNoteDataSource>(
      () => DeleteNoteDataSourceImpl(
        firebaseFirestore: i.get<FirebaseFirestore>(),
      ),
    );

    /// Repositories injections.
    i.add<CreateNoteRepository>(
      () => CreateNoteRepositoryImpl(
        createNoteDataSource: i.get<CreateNoteDataSource>(),
      ),
    );
    i.add<UpdateNoteRepository>(
      () => UpdateNoteRepositoryImpl(
        updateNoteDataSource: i.get<UpdateNoteDataSource>(),
      ),
    );
    i.add<DeleteNoteRepository>(
      () => DeleteNoteRepositoryImpl(
        deleteNoteDataSource: i.get<DeleteNoteDataSource>(),
      ),
    );

    /// UseCases injections.
    i.add<CreateNoteUseCase>(
      () => CreateNoteUseCaseImpl(
        createNoteRepository: i.get<CreateNoteRepository>(),
      ),
    );
    i.add<UpdateNoteUseCase>(
      () => UpdateNoteUseCaseImpl(
        updateNoteRepository: i.get<UpdateNoteRepository>(),
      ),
    );
    i.add<DeleteNoteUseCase>(
      () => DeleteNoteUseCaseImpl(
        deleteNoteRepository: i.get<DeleteNoteRepository>(),
      ),
    );

    /// Stores Injections.
    i.add<RegisterNoteState>(
      () => RegisterNoteState(
        createNoteUseCase: i.get<CreateNoteUseCase>(),
        updateNoteUseCase: i.get<UpdateNoteUseCase>(),
        deleteNoteUseCase: i.get<DeleteNoteUseCase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterNotePage());
  }
}
