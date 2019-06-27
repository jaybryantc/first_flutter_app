import 'package:first_flutter_app/redux/middlewares/auth_middleware.dart';
import 'package:first_flutter_app/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:first_flutter_app/redux/reducers/app_reducer.dart';
import 'middlewares/navigation_middleware.dart';
import 'package:redux_logging/redux_logging.dart';

Store<AppState> createStore() {
  return Store(
    appReducer,
    initialState: AppState(),
    middleware: [
      AuthMiddleware(),
      LoggingMiddleware.printer(),
      NavigationMiddleware(),
    ]
  );
}
