import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smart_shop/core/widgets/custom_loading.dart';
import 'package:smart_shop/features/register_view/logic/register_state.dart';
import 'package:smart_shop/features/register_view/widgets/profile_image.dart';
import 'package:smart_shop/features/register_view/widgets/text_field_section.dart';

import '../../../config/local/cache_helper.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/functions/show_snack_bar.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/app_name_text_widget.dart';
import '../logic/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisterCreateUserSuccessState){
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            Navigator.pushReplacementNamed(context, Routes.layoutView);
            showSuccessSnackBar(context: context, message: 'Register Successful');
          });

        }else if(state is RegisterCreateUserErrorState){
          showErrorSnackBar(context: context, message: state.error);
        }else if(state is RegisterErrorState){
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return CustomLoading(
          isLoading: state is RegisterLoadingState,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: AppNameTextWidget(fontSize: 30,)),
                  verticalSpace(15),
                  Text('Welcome Back',style: AppStyles.font20BlackBoldWeight,),
                  Text('Lets get you logged in as you can start exploring',style: AppStyles.font16WhiteRegular,),
                  verticalSpace(20),
                  const ProfileImage(),
                  verticalSpace(20),
                  const TextFieldSection(),
                  verticalSpace(20),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CacheHelper.getData(key: 'isDark')!? AppColors.lightPrimary : AppColors.primary1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        RegisterCubit.get(context).registerData();

                      },
                      child: Text('Sign up',style: AppStyles.font16WhiteRegular.copyWith(color: AppColors.white),),
                    ),
                  ),
                  verticalSpace(15),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(context, Routes.loginView),
                              child: Text('Sign in'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
