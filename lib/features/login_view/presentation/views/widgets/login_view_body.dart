import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/utils/app_colors.dart';
import 'package:smart_shop/core/utils/app_styles.dart';
import 'package:smart_shop/core/widgets/custom_loading.dart';
import 'package:smart_shop/features/login_view/presentation/views/widgets/text_field_section.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/show_snack_bar.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_name_text_widget.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            Navigator.pushReplacementNamed(context, Routes.layoutView);
            showSuccessSnackBar(
                context: context, message: 'Login Successful');
          });

        } else if (state is LoginFailureState) {
          print(state.error);
          showErrorSnackBar(context: context, message: state.error);
        }
      },
      builder: (context, state) {
        return CustomLoading(
          isLoading: state is LoginLoadingState,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: AppNameTextWidget()),
                  verticalSpace(15),
                  Text('Welcome Back',style: AppStyles.font20BlackBoldWeight,),
                  Text('Lets get you logged in as you can start exploring',style: AppStyles.font16WhiteRegular,),
                  verticalSpace(20),
                  const TextFieldSection(),
                  Align(
                    alignment: Alignment.centerRight,
                      child: Text('Forget Password?')),
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
                          if (LoginCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).userrLogin(email: LoginCubit.get(context).userNameController.text, password: LoginCubit.get(context).passwordController.text);
                          }
                        },
                      child: Text('Sign in',style: AppStyles.font16WhiteRegular.copyWith(color: AppColors.white),),
                    ),
                  ),
                  verticalSpace(15),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('OR CONNECT USING',style: AppStyles.font20BlackBoldWeight.copyWith(color: AppColors.grey),),
                        verticalSpace(10),
                        ElevatedButton.icon(

                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))
                          ),
                            onPressed: () => Navigator.pushReplacementNamed(context, Routes.layoutView),
                            icon: Icon(Ionicons.logo_google),
                            label: Text('Sign in with google',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () => Navigator.pushReplacementNamed(context, Routes.registerView),
                              child: Text('Sign up'),
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
