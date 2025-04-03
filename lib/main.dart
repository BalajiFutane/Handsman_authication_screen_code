import 'package:auth_project/firebase_options.dart';
import 'package:auth_project/screen/category/category_screen.dart';
import 'package:auth_project/screen/category/shimmer/category_shimmer.dart';
import 'package:auth_project/screen/change_password_screen.dart';
import 'package:auth_project/screen/dashboard/component/booking_confirmed_component.dart';
import 'package:auth_project/screen/dashboard/component/category_component.dart';
import 'package:auth_project/screen/dashboard/component/category_widget.dart';
import 'package:auth_project/screen/dashboard/component/customer_ratings_component.dart';
import 'package:auth_project/screen/dashboard/component/new_job_request_component.dart';
import 'package:auth_project/screen/dashboard/component/slider_and_location_component.dart';
import 'package:auth_project/screen/dashboard/component/wallet_history.dart';
import 'package:auth_project/screen/dashboard/component/wallet_history_shimmer.dart';
import 'package:auth_project/screen/dashboard/customer_rating_screen.dart';
import 'package:auth_project/screen/dashboard/dashboard_screen.dart';
import 'package:auth_project/screen/dashboard/fragment/booking_fragment.dart';
import 'package:auth_project/screen/dashboard/fragment/dashboard_fragment.dart';
import 'package:auth_project/screen/dashboard/shimmer/dashboard_shimmer.dart';
import 'package:auth_project/screen/newDashboard/dashboard_1/component/booking_confirmed_component_1.dart';
import 'package:auth_project/screen/newDashboard/dashboard_1/component/slider_dashboard_component_1.dart';
import 'package:auth_project/screen/newDashboard/dashboard_1/dashboard_fragment_1.dart';
import 'package:auth_project/screen/newDashboard/dashboard_1/shimmer/dashboard_shimmer_1.dart';
import 'package:auth_project/screen/newDashboard/dashboard_2/component/category_list_dashboard_component_2.dart';
import 'package:auth_project/screen/newDashboard/dashboard_2/component/job_request_dashboard_component_2.dart';
import 'package:auth_project/screen/newDashboard/dashboard_2/dashboard_fragment_2.dart';
import 'package:auth_project/screen/newDashboard/dashboard_2/shimmer/dashboard_shimmer_2.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/component/job_request_dahboard_component_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/dashboard_fragment_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_3/shimmer/dashboard_shimmer_3.dart';
import 'package:auth_project/screen/newDashboard/dashboard_4/component/app_bar_dashboard_component_4.dart';
import 'package:auth_project/screen/newDashboard/dashboard_4/component/job_request_dashboard_component_4.dart';
import 'package:auth_project/screen/newDashboard/dashboard_4/dashboard_fragment_4.dart';
import 'package:auth_project/screen/dashboard/component/grid-design.dart';
import 'package:auth_project/screen/newDashboard/dashboard_4/shimmer/dashboard_shimmer_4.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebas

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


      ),
      // home:SliderDashboardComponent1(
      //
      //   sliderList: [
      //
      //     "assets/icon/img1.jpg",
      //     "assets/icon/img2.jpg",
      //     "assets/icon/img1.jpg",
      //     "assets/icon/img2.jpg",
      //     // {"name": "House Cleaning", "image": "assets/images/service3.jpg"},
      //
      //
      //   ],
      //
      //
      //
      //
      // ),


home:  Scaffold(

  backgroundColor: Colors.white,


  body: SingleChildScrollView(
    child: Column(
      children: [
        16.height,
    SliderDashboardComponent1(

      sliderList: [

        "assets/icon/img1.jpg",
        "assets/icon/img2.jpg",
        "assets/icon/img1.jpg",
        "assets/icon/img2.jpg",
        // {"name": "House Cleaning", "image": "assets/images/service3.jpg"},


      ],


    ),
        SizedBox(
          height: 30,
        ),
        CategoryListComponent(),
        SizedBox(
          height: 30,
        ),
        ServiceList(),
        SizedBox(
          height: 30,
        ),
        // HomeScreen(),
        ServiceListNormalGrid(),

        NewJobRequestComponent(),

        JobRequestDashboardComponent4(),
        // DashboardFragment3(),

        // DashboardShimmer1(),
        // DashboardShimmer4(),
        DashboardShimmer(),
        // DashboardShimmer2(),

        JobRequestDashboardComponent2(),

        CategoryShimmer(),



        // PendingBookingComponent()
      ],
    ),
  ),
)


    );
  }
}

// from above compontes remove backend dependancy ..and keep ui same ...



