import 'package:flutter_bloc/flutter_bloc.dart';

enum Themes { Initial, Light, Dark }

class ThemeCubit extends Cubit<Themes> {
  ThemeCubit() : super(Themes.Initial);

  Themes currentTheme = Themes.Light;

  changeTheme() => currentTheme == Themes.Light
      ? emit(currentTheme = Themes.Dark)
      : emit(currentTheme = Themes.Light);
}
