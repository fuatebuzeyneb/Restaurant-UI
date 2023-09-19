part of '../import_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('heloo'),
          ElevatedButton(
            onPressed: () {},
            child: Text('kjhjkgk'),
          ),
          SwitchListTile(
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
            title: Text(themeProvider.getIsDarkTheme ? 'dark' : 'light'),
          ),
        ],
      ),
    );
  }
}
