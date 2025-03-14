import 'package:bookworm/local_db/app_db.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.I;

void setUp() {
  // registering a singleton Database instance to avoide RACE condition
  getIt.registerLazySingleton<Database>(
    () => Database(),
  );
}
