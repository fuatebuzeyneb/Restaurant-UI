part of '../import_path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // clipBehavior: Clip.none,
        children: [
          Scaffold(
            backgroundColor: themeProvider.getIsDarkTheme
                ? AppColors.darkCardColor
                : AppColors.lightCardColor,
            appBar: AppBar(
              backgroundColor: themeProvider.getIsDarkTheme
                  ? AppColors.darkPrimaryColor
                  : AppColors.lightPrimaryColor,
              title: Text(
                'Profile',
                style: TextStyle(
                    color: themeProvider.getIsDarkTheme
                        ? Colors.black
                        : Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: themeProvider.getIsDarkTheme
                          ? AppColors.darkPrimaryColor
                          : AppColors.lightPrimaryColor,
                      height: size.height * 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.295,
                          ),
                          ProfileWidget(
                            title: 'All Product',
                            image: AppImagesPath.profileAllOrder,
                            fct: () async {
                              await Navigator.pushNamed(
                                  context, OrderScreen.routName);
                            },
                          ),
                          ProfileWidget(
                            title: 'Wishlist',
                            image: AppImagesPath.profilewishlist,
                            fct: () async {
                              await Navigator.pushNamed(
                                  context, WishlistScreen.routName);
                            },
                          ),
                          ProfileWidget(
                            title: 'Viewed recently',
                            image: AppImagesPath.profileclock,
                            fct: () async {
                              await Navigator.pushNamed(
                                  context, ViewedScreen.routName);
                            },
                          ),
                          ProfileWidget(
                              title: 'Address',
                              image: AppImagesPath.profilelocation,
                              fct: () {}),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ProfileWidget(
                                  title: themeProvider.getIsDarkTheme
                                      ? 'dark'
                                      : 'light',
                                  image: themeProvider.getIsDarkTheme
                                      ? AppImagesPath.profiledarkmode
                                      : AppImagesPath.profilelightmode,
                                  fct: () {}),
                              SizedBox(
                                width: 150,
                              ),
                              Switch(
                                activeColor: Colors.black,
                                activeTrackColor: AppColors.darkPrimaryColor,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: AppColors.lightPrimaryColor,
                                value: themeProvider.getIsDarkTheme,
                                onChanged: (value) {
                                  themeProvider.setDarkTheme(themeValue: value);
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: ButtonWidgetOne(
                              paddingVertical: 12,
                              text: 'logout',
                              image: IconlyBold.logout,
                              fct: () async {
                                await Navigator.pushNamed(
                                    context, LoginScreen.routName);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.13,
            child: SizedBox(
              height: size.height * 0.25,
              width: size.width * 0.9,
              child: Card(
                elevation: 5,
                color:
                    themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.22,
            top: size.height * 0.17,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1610088441520-4352457e7095?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG1lbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Fuat EBUZEYNEB",
                  style: TextStyle(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.white
                          : Colors.black,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "fuatebuzeyneb@gmail.com",
                  style: TextStyle(
                      color: themeProvider.getIsDarkTheme
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
 DialogWarningFct.showDialogWarning(
                        context: context,
                        subtitle: 'Are you sure??',
                        fct: () async {
                         
                        },
                        isError: false);
*/