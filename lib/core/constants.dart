import 'package:glitzup/presentatioon/screens/home_screen.dart';
import 'package:glitzup/presentatioon/screens/notification_screen.dart';
import 'package:glitzup/presentatioon/screens/profile_screen.dart';
import 'package:glitzup/presentatioon/screens/search_screen.dart';
import 'package:glitzup/presentatioon/screens/uploadpost_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

final screens = [
  HomeScreen(),
  SearchScreen(),
  UploadPost(),
  NotificationScreen(),
  ProfileScreen()
];

 final googleSignIn = GoogleSignIn();
