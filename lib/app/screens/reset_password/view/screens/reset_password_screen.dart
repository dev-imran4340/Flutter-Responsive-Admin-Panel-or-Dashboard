import 'package:admin/app/core/assets/app_images.dart';
import 'package:admin/app/core/utils/app_spaces.dart';
import 'package:admin/app/core/widgets/auth_header.dart';
import 'package:admin/app/responsive.dart';
import 'package:admin/app/screens/reset_password/components/reset_password_form.dart';
import 'package:admin/app/screens/reset_password/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
        init: ResetPasswordController(),
        builder: (controller) => SingleChildScrollView(
              child: Column(
                children: [
                  if (Responsive.isDesktop(context)) AuthHeader(),
                  height20,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      children: [
                        if (Responsive.isDesktop(context)) ...[
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  AppImages.img1,
                                ),
                              ],
                            ),
                          ),
                        ],
                        Expanded(child: ResetPasswordForm())
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
