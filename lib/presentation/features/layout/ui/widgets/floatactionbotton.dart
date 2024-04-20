import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/svgIcon.dart';

class MyFloatActionButton extends StatelessWidget {
  const MyFloatActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      elevation: 0,
      backgroundColor: Colors.grey.withOpacity(.2),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(1000),
        borderSide: BorderSide.none,
      ),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          margin: const EdgeInsets.all(0),
          borderOnForeground: false,
          color: Colors.white,
          elevation: 1,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(13.0),
              child: SvgIcon(
                svg: 'cart',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
