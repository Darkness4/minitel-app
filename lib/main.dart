import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/provider_setup.dart';
import 'package:minitel_toolbox/ui/router.dart';
import 'package:minitel_toolbox/ui/shared/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetup.providers,
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            return ChangeNotifierProvider<ThemeChanger>(
              builder: (_) {
                final bool dark = snapshot.data.getBool('dark');
                if (dark != null && dark) {
                  return ThemeChanger(
                    MinitelThemeData.dark,
                  );
                } else {
                  return ThemeChanger(
                    MinitelThemeData.light,
                  );
                }
              },
              child: const MaterialAppWithTheme(),
            );
          }
          return const Center();
        },
      ),
    );
  }
}

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
      ],
      title: "Minitel Toolbox",
      onGenerateRoute: Router.generateRoute,
      supportedLocales: const <Locale>[Locale('fr', 'FR')],
      theme: themeChanger.theme,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: RoutePaths.Authentication,
    );
  }
}
