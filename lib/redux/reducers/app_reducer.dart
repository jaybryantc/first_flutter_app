import 'package:first_flutter_app/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:first_flutter_app/redux/reducers/auth_reducer.dart';

AppState appReducer(AppState state, action) => state.rebuild((state) {
  state ..authState.replace(auth_reducer(state.authState.build(), action));
});