// ignore_for_file: invalid_use_of_protected_member
import 'package:admin/app/core/utils/app_colors.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/utils/app_textstyle.dart';
import 'package:admin/app/core/widgets/Custom_container.dart';
import 'package:admin/app/core/widgets/InnerPadding.dart';
import 'package:admin/app/core/widgets/small_buttom.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/subscription/controller/sunscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (controller) => Title(
              color: AppColors.primaryColor,
              title: "Subscriptions",
              child: Column(children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.currentSubscriptionModel.value.data !=
                              null) ...[
                            CustomContainer(
                                borderColor: AppColors.secondaryColor,
                                backColor: AppColors.whiteColor,
                                child: InnerPadding(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Current Subscription: ",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 12),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          Text(
                                              controller
                                                  .currentSubscriptionModel
                                                  .value
                                                  .data!
                                                  .name
                                                  .toString(),
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 14),
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          Spacer(),
                                          Text(
                                              "\$${(controller.currentSubscriptionModel.value.data!.amount)! / 100}",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 14),
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ],
                                      ),
                                      height10,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Start Date:  ${controller.currentSubscriptionModel.value.data!.startDate!.split("T")[0]}",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 12),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                          Text(
                                              "End Date:  ${controller.currentSubscriptionModel.value.data!.endDate!.split("T")[0]}",
                                              style: AppTextstyle.text10
                                                  .copyWith(
                                                      fontSize: FontSizeManager
                                                          .getFontSize(
                                                              context, 12),
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            height10
                          ],
                          Text("Subscriptions Packages",
                              style: AppTextstyle.text10.copyWith(
                                  fontSize:
                                      FontSizeManager.getFontSize(context, 18),
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold)),
                          height18,
                          Expanded(
                            child: Obx(
                              () => controller.subscriptionsPackages.isEmpty
                                  ? InnerPadding(
                                      child: Center(
                                        child: Text(
                                          "No Subscriptions Found!",
                                          style: AppTextstyle.text10.copyWith(
                                            fontSize:
                                                FontSizeManager.getFontSize(
                                                    context, 14),
                                            color: AppColors.backColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          // Determine crossAxisCount based on screen width
                                          int crossAxisCount;
                                          if (Responsive.isDesktop(context)) {
                                            crossAxisCount = 3;
                                          } else if (Responsive.isTablet(
                                              context)) {
                                            crossAxisCount = 2;
                                          } else {
                                            crossAxisCount = 1;
                                          }

                                          return GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent:
                                                  Responsive.isMobile(context)
                                                      ? 200.h
                                                      : 280.h,
                                              crossAxisCount:
                                                  crossAxisCount, // Dynamic column count
                                              crossAxisSpacing:
                                                  10.0, // Space between columns
                                              mainAxisSpacing:
                                                  10.0, // Space between rows
                                              // childAspectRatio:
                                              //     Responsive.isMobile(context)
                                              //         ? 6 / 2
                                              //         : Responsive.isTablet(context)
                                              //             ? 1.7
                                              //             : 1.6, // Adjust as needed
                                            ),
                                            itemCount: controller
                                                .subscriptionsPackages
                                                .value
                                                .length,
                                            itemBuilder: (context, index) {
                                              final subscription = controller
                                                  .subscriptionsPackages
                                                  .value[index];

                                              final amount = subscription
                                                  .plans![0].unitAmount;
                                              final centAMount = amount! / 100;

                                              return InkWell(
                                                onTap: () {
                                                  // AppPreferences.setProjectDetail(
                                                  //     project.toJson());
                                                  // Get.toNamed(
                                                  //     AppRoutes.projectDetailScreen);
                                                  // // Navigate to project details
                                                },
                                                child: CustomContainer(
                                                  borderColor:
                                                      AppColors.primaryColor,
                                                  backColor:
                                                      AppColors.whiteColor,
                                                  child: InnerPadding(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    subscription
                                                                        .product!
                                                                        .name
                                                                        .toString(),
                                                                    style: AppTextstyle
                                                                        .text10
                                                                        .copyWith(
                                                                      fontSize: FontSizeManager.getFontSize(
                                                                          context,
                                                                          15),
                                                                      color: AppColors
                                                                          .textColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    subscription
                                                                        .product!
                                                                        .description
                                                                        .toString(),
                                                                    style: AppTextstyle
                                                                        .text10
                                                                        .copyWith(
                                                                      fontSize: FontSizeManager.getFontSize(
                                                                          context,
                                                                          12),
                                                                      color: AppColors
                                                                          .textColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Text(
                                                              "\$${centAMount}",
                                                              style:
                                                                  AppTextstyle
                                                                      .text10
                                                                      .copyWith(
                                                                fontSize: FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        15),
                                                                color: AppColors
                                                                    .backColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "Features:",
                                                          style: AppTextstyle
                                                              .text10
                                                              .copyWith(
                                                            fontSize:
                                                                FontSizeManager
                                                                    .getFontSize(
                                                                        context,
                                                                        12),
                                                            color: AppColors
                                                                .textColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        _row(
                                                            context: context,
                                                            text:
                                                                "Admin: ${subscription.product!.metadata!.admins ?? ""}"),
                                                        _row(
                                                            context: context,
                                                            text:
                                                                "Compines: ${subscription.product!.metadata!.companies ?? ""}"),
                                                        _row(
                                                            context: context,
                                                            text:
                                                                "Projects: ${subscription.product!.metadata!.projects ?? ""}"),
                                                        _row(
                                                            context: context,
                                                            text:
                                                                "Reminders: ${subscription.product!.metadata!.reminders ?? ""}"),
                                                        _row(
                                                            context: context,
                                                            text:
                                                                "Tasks: ${subscription.product!.metadata!.tasks ?? ""}"),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            SmallButton(
                                                              onclick: () {
                                                                controller.planCheckOut(
                                                                    planId: controller
                                                                        .subscriptionsPackages[
                                                                            index]
                                                                        .plans![
                                                                            0]
                                                                        .id
                                                                        .toString());
                                                              },
                                                              name: "Buy",
                                                              width: 70,
                                                              backcolor:
                                                                  AppColors
                                                                      .backColor,
                                                              textColor: AppColors
                                                                  .whiteColor,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ));
  }
}

Widget _row({text, context}) {
  return Row(
    children: [
      Icon(
        Icons.checklist_rounded,
        color: AppColors.primaryColor,
        size: 15.h,
      ),
      width4,
      Text(
        text,
        style: AppTextstyle.text10.copyWith(
          fontSize: FontSizeManager.getFontSize(context, 11),
          color: AppColors.greyColor,
        ),
      ),
    ],
  );
}
