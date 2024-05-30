import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/config/theme_cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;



  void toggleTheme({required value}) {
    isDark = value;
    CacheHelper.saveData(key: 'isDark', value: isDark);
    print(CacheHelper.getData(key: 'isDark'));
    emit(ThemeChangedState());
  }
}