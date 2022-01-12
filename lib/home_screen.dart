import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'favouritePokemon/view/widgets/badge.dart';
import 'favouritePokemon/view/screens/favourites.dart';
import 'pokemon/view/screens/all_pokemons.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffE8E8E8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          title: SvgPicture.asset(
            'assets/images/AppBar.svg',
            height: 33.h,
            width: 134.w,
          ),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 52.h,
              width: 375.w,
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'NotoSans',
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: const Color(0xff6B6B6B),
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'NotoSans',
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                indicator: MaterialIndicator(
                  height: 4.h,
                  topLeftRadius: 4.h,
                  topRightRadius: 4.h,
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  tabPosition: TabPosition.bottom,
                  color: const Color(0xff3558CD),
                ),
                tabs: [
                  const Text(
                    'All Pokemons',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Favourites',
                      ),
                      SizedBox(width: 4.w),
                      const Badge(),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [const AllPokemons(), Favourites()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
