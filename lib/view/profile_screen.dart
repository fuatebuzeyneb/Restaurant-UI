part of '../import_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            title: const Text('Profile Screen'),
            //Text('Profile Screen'),
            // AppBarTitle(title: 'Profile Screen'),
            leading: Image.asset(
              AppImagesPath.profilemenu,
              color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TitlesTextWidget(
                      label: 'Please login to have ulimate access'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.background,
                            width: 3),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Fuat EBUZEYNEB"),
                        SubtitleTextWidget(label: "fuatebuzeyneb@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitlesTextWidget(label: "General"),
                    ProfileListTile(
                      imagePath: AppImagesPath.profileAllOrder,
                      text: "All orders",
                      function: () {},
                    ),
                    ProfileListTile(
                      imagePath: AppImagesPath.profilewishlist,
                      text: "Wishlist",
                      function: () {},
                    ),
                    ProfileListTile(
                      imagePath: AppImagesPath.profileclock,
                      text: "Viewed recently",
                      function: () {},
                    ),
                    ProfileListTile(
                      imagePath: AppImagesPath.profilelocation,
                      text: "Address",
                      function: () {},
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TitlesTextWidget(label: "Settings"),
                    const SizedBox(
                      height: 7,
                    ),
                    SwitchListTile(
                      secondary: Image.asset(
                        themeProvider.getIsDarkTheme
                            ? AppImagesPath.profiledarkmode
                            : AppImagesPath.profilelightmode,
                        height: 30,
                        color: themeProvider.getIsDarkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      },
                      title:
                          Text(themeProvider.getIsDarkTheme ? 'dark' : 'light'),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "Login",
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
