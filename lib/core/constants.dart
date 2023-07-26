import 'package:glitzup/presentatioon/screens/home_screen.dart';
import 'package:glitzup/presentatioon/screens/notification_screen.dart';
import 'package:glitzup/presentatioon/screens/profile_screen.dart';
import 'package:glitzup/presentatioon/screens/search_screen.dart';
import 'package:glitzup/presentatioon/screens/uploadpost_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

final screens = [
  const HomeScreen(),
  const SearchScreen(),
  const UploadPost(),
  const NotificationScreen(),
  const ProfileScreen()
];

 final googleSignIn = GoogleSignIn();


const profileImage = 'https://w7.pngwing.com/pngs/304/275/png-transparent-user-profile-computer-icons-profile-miscellaneous-logo-monochrome-thumbnail.png';
