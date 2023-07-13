import 'package:flutter/material.dart';

import '../../util/Constants.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_profile_item.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
