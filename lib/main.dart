import 'package:crud_getx/app/modules/views/pages/api/api_screen.dart';
import 'package:crud_getx/app/modules/views/pages/auth/otp/otp_screen.dart';
import 'package:crud_getx/app/modules/views/pages/auth/otp/phoneno_screen.dart';
import 'package:crud_getx/app/modules/views/pages/database%20firestore/firestore_screen.dart';
import 'package:crud_getx/constant/export.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  runApp(const MyApp());
}

final getStorage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    home:ApiScreen(),
      // (getStorage.read('NUMBERID')!=null)? SignUpScreen():SignUpScreen(),
    );
  }
}
