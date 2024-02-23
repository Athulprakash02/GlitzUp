import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/controller/search%20controller/search_controller.dart';
import 'package:glitzup/model/user%20model/user_model.dart';
import 'package:glitzup/views/widgets/user_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchQueryController searchQueryController =
        Get.put(SearchQueryController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchQueryController.searchController,
              onChanged: (value) => searchQueryController.searchUser(value),
              backgroundColor: const Color.fromARGB(255, 65, 64, 64),
              
            ),
            Expanded(
              child: SizedBox(child: Obx(() {
                List<UserModel> searchResults =
                    searchQueryController.users.toList();
                return ListView.builder(
                  itemCount:searchResults.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(searchResults[index].userName);
                      },
                      child: UserTile(
                        text: searchResults[index].userName,
                      ),
                    );
                  },
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}
