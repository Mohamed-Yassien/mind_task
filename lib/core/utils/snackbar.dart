import 'package:easy_localization/easy_localization.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/customtext.dart';
import '../../core/utils/alerts.dart';

Widget snackDesgin(BuildContext context, SnakState state, String text) {
  return Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white.withOpacity(0.95),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              state == SnakState.success
                  ? Lottie.asset(
                      "assets/json/success.json",
                      width: 100,
                      height: 100,
                    )
                  : Lottie.asset(
                      "assets/json/error.json",
                      width: 100,
                      height: 100,
                    ),
              const SizedBox(
                height: 10.0,
              ),
              if (state == SnakState.success)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CustomText(
                      'شكرا لك',
                      fontSize: 16.0,
                      align: TextAlign.center,
                      color: Colors.black,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              if (state == SnakState.failed)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CustomText(
                      'excuseus'.tr(),
                      fontSize: 16.0,
                      align: TextAlign.center,
                      color: Colors.black,
                      weight: FontWeight.w400,
                    ),
                  ),
                ),
              const SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CustomText(
                    text,
                    fontSize: 14.0,
                    align: TextAlign.center,
                    color: Colors.grey,
                    weight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
