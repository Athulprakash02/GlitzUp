import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitzup/model/user%20model/user_model.dart';
import 'package:glitzup/services/search/search.dart';

class SearchQueryController extends GetxController {
  final RxList<UserModel> users = <UserModel>[].obs;
  final SearchService _searchService = SearchService();
  TextEditingController searchController = TextEditingController();

  void searchUser(String searchQuery) async {
    print(searchQuery);
    users.clear();
  
      _searchService.fetchSearchDetails(searchQuery, users);
  
    
  
  }
}
