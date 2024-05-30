import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight +10,
      child: Row(
        children: [
          Text('Total 6 products / 6 items'),
          Text('\$150'),
        ],
      ),
    );
  }
}
