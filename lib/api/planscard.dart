import 'package:app_challenge_2k22/api/plansModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../base_models/appColors.dart';
import '../base_models/baseTexts.dart';


class CardWidget extends StatelessWidget {
  // Atributos
  final double borderRadius = 5;
  final double headerHeight = 85;
  final Color borderColor = AppColors.border;
  final Color headerColor = AppColors.darkBlue;
  final Color backColor = AppColors.white;
  final VoidCallback onTap;
  PlansModel plans;

  CardWidget({
    Key? key,
    required this.onTap,
    required this.plans,
  }) : super(key: key);

  // Métodos
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: headerHeight,
                decoration: BoxDecoration(
                  color: headerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, right: 2),
                  child: Column(
                    children: [
                      Text(plans.id.toString(), style: AppTextStyles.bodybold18),
                      Text(plans.isp, style: AppTextStyles.bodyWhite),

                      if (plans.type_of_internet == 'cable')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Icon(
                              CupertinoIcons.arrow_swap,
                              size: 12,
                              color: AppColors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 1),
                              child: Text(
                                plans.download_speed.toString(),
                                style: AppTextStyles.bodyWhite,
                              ),
                            ),
                          ],
                        )
                      else if (plans.type_of_internet == 'radio')
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              CupertinoIcons.antenna_radiowaves_left_right,
                              size: 12,
                              color: AppColors.white,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Text(
                                plans.download_speed.toString(),
                                style: AppTextStyles.bodyWhite,
                              ),
                            ),
                          ],
                        )

                      else if (plans.type_of_internet == 'wire')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                CupertinoIcons.wifi,
                                size: 12,
                                color: AppColors.white,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: Text(
                                  plans.download_speed.toString(),
                                  style: AppTextStyles.bodyWhite,
                                ),
                              ),
                            ],
                          )

                        else if (plans.type_of_internet == 'sat')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  CupertinoIcons.cloud_upload_fill,
                                  size: 12,
                                  color: AppColors.white,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Text(
                                    plans.download_speed.toString(),
                                    style: AppTextStyles.bodyWhite,
                                  ),
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 8),
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.money_dollar,
                        size: 18,
                        color: AppColors.black,
                      ),
                      Flexible(
                        child: Text(
                          plans.price_per_month.toString(),
                          style: AppTextStyles.heading15,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        plans.description,
                        style: AppTextStyles.body,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
