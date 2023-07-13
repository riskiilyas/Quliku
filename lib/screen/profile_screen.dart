import 'package:flutter/material.dart';
import 'package:quliku/util/Constants.dart';
import 'package:quliku/widget/custom_button.dart';
import 'package:quliku/widget/custom_profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Constants.COLOR_MAIN, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          "Profil Saya",
          style: TextStyle(
              color: Constants.COLOR_TITLE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 80,
                              child: Image.asset(
                                "assets/dummy-profile.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Husin Muhammad Assegaff Arrabbanii",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Constants.COLOR_TITLE,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.construction,
                                      size: 12,
                                    ),
                                    Text(
                                      "2 Proyek Berjalan",
                                      style: TextStyle(
                                        color: Constants.COLOR_TEXT,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.check,
                                      size: 12,
                                    ),
                                    Text(
                                      "2 Proyek Berjalan",
                                      style: TextStyle(
                                        color: Constants.COLOR_TEXT,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () => {},
                                      child: const Text(
                                        "Edit Profil",
                                        style: TextStyle(
                                          color: Constants.COLOR_MAIN,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ProfileItem(
                              title: "Proyek Saya",
                              icon: Icons.location_city,
                              onPressed: () => {}),
                          const SizedBox(
                            height: 12,
                          ),
                          ProfileItem(
                              title: "Wishllist Saya",
                              icon: Icons.favorite,
                              onPressed: () => {}),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                      text: "Keluar",
                      textColor: Colors.white,
                      buttonColor: Constants.COLOR_MAIN,
                      onPressed: () => {})
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Constants.COLOR_MAIN,
        elevation: 2.0,
        child: const Icon(Icons.search),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.home, size: 30)),
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.person, size: 30))
          ],
        ),
      ),
    );
  }
}
