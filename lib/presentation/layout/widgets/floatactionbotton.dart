import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/svgIcon.dart';

class MyFloatActionButton extends StatelessWidget {
  const MyFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      onPressed: () {
        // Navigator.pushNamed(context, Routes.cartScreen);
      },
      child: Card(
        margin: const EdgeInsets.all(0),
        borderOnForeground: false,
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: SvgIcon(
              svg: 'cart_circle.svg',
            ),
          ),
        ),
      ),
    );
  }
}
