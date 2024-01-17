import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../features/data/data.dart';
import '../../../features/domain/domain.dart';
import '../../../features/presentation/presentation.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    /// DataSources injections.
    i.add<ReadNotesDataSource>(
      () => ReadNotesDataSourceImpl(
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
    i.add<ReadNotesRepository>(
      () => ReadNotesRepositoryImpl(
        readNotesDataSource: i.get<ReadNotesDataSource>(),
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
    i.add<ReadNotesUseCase>(
      () => ReadNotesUseCaseImp(
        readNotesRepository: i.get<ReadNotesRepository>(),
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
    i.add<HomeState>(
      () => HomeState(
        readNotesUseCase: i.get<ReadNotesUseCase>(),
        updateNoteUseCase: i.get<UpdateNoteUseCase>(),
        deleteNoteUseCase: i.get<DeleteNoteUseCase>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
