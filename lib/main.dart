import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mealed_project/cubit/singup/signup_cubit.dart';
import 'package:mealed_project/firebase_options.dart';
import '../views/login.dart';
import 'cubit/login/login_cubit.dart';
import 'views/ForgetPassword.dart';
import 'views/pages/all_categories.dart';
import 'views/pages/historique_page.dart';
import 'views/pages/home_page.dart';
import 'views/pages/localisations.dart';
import 'views/pages/one_article.dart';
import 'views/pages/one_resto.dart';
import 'views/pages/profile_page.dart';
import 'views/pages/restaurants_page.dart';
import 'views/welcome_page.dart';
import 'views/signup.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
 providers: [
      BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
      BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(),
          ),
          ]    ,
            child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'meald',
        initialRoute: '/',
        routes: {
             '/': (context) => WelcomePage(),
            '/homePageClient': (context) => HomePageClient(),
            '/profilePage_client': (context) => ProfilePage(),
            '/Signup': (context) => Signup(),
            '/Login': (context) => Login(),
            '/categories': (context) => AllCategories(),
            '/mot_de_passe': (context) => ForgetPassword(),
            '/profile_resto': (context) => ProfileResto(), 
            '/article': (context) => OneArticle(), 
            '/restaurants': (context) => RestaurantsPage(), 
            '/historique': (context) => HistoryPage(), 
            '/localisations': (context) => LocalisationsPage(), 
        },
      ),
    );
  }
}
