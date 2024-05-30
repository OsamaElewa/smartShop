import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../logic/home_cubit.dart';


class SwiperSection extends StatelessWidget {
  const SwiperSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *0.20,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context,int index){
          return Image(image: AssetImage(HomeCubit.get(context).swiperImages[index]));
        },
        itemCount: HomeCubit.get(context).swiperImages.length,
        pagination: const SwiperPagination(),
      ),
    );
  }
}
