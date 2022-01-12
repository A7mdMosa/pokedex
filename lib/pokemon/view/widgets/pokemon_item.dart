import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/pokemon/Data/models/pokemon.dart';
import '/pokemon/view/screens/details_screen.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemon;

  Color getPokemonColor(String types) {
    if (types.contains('Water') || types.contains('Normal')) {
      return const Color(0xffF3F9FE);
    } else if (types.contains('Fire')) {
      return const Color(0xffFDF1F1);
    } else if (types.contains('Grass')) {
      return const Color(0xffF3F9EF);
    } else if (types.contains('Electric') || types.contains('Psychic')) {
      return const Color(0xffF9FFB1);
    } else if (types.contains('Poison')) {
      return const Color(0xffF2E8FF);
    } else if (types.contains('Ground') || types.contains('Fighting')) {
      return const Color(0xffFFECB8);
    } else if (types.contains('Fairy')) {
      return const Color(0xffFFEDEF);
    } else {
      return const Color(0xffE9FFED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.route, arguments: pokemon);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 104.h,
              width: 110.w,
              color: getPokemonColor(pokemon.types),
              child: Image.network(
                pokemon.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 9.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'NotoSans',
                      color: const Color(0xff6B6B6B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'NotoSans',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    pokemon.types,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'NotoSans',
                      color: const Color(0xff6B6B6B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
