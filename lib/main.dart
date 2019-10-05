import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/provider_setup.dart';
import 'package:minitel_toolbox/ui/router.dart';
import 'package:minitel_toolbox/ui/shared/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLoc.delegate,
      ],
      title: "Minitel Toolbox",
      onGenerateRoute: Router.generateRoute,
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('it', ''),
        Locale('fr', 'FR'),
      ],
      theme: themeChanger.theme,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RoutePaths.Authentication,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetup.providers,
      child: ChangeNotifierProvider<ThemeChanger>(
        builder: (_) {
          final ThemeChanger themeChanger = ThemeChanger(
            MinitelThemeData.light,
          );
          SharedPreferences.getInstance().then((SharedPreferences prefs) {
            final bool dark = prefs.getBool('dark') ?? false;
            if (dark != null && dark) {
              themeChanger.theme = MinitelThemeData.dark;
            }
          });

          return themeChanger;
        },
        child: const MaterialAppWithTheme(),
      ),
    );
  }
}
