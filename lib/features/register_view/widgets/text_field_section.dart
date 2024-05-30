import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/register_view/logic/register_cubit.dart';
import 'package:smart_shop/features/register_view/logic/register_state.dart';

import '../../../core/widgets/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.name,
                  controller: RegisterCubit.get(context).userNameController,
                  prefixIcon: Icon(Icons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your user name';
                    }
                    return null;
                  },
                  title: 'User name',
                  hintText: 'Enter your user name'
              ),
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                  controller: RegisterCubit.get(context).emailController,
                  prefixIcon: Icon(Icons.email),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your email address';
                    }
                    return null;
                  },
                  title: 'Email',
                  hintText: 'Enter your email address'
              ),
              CustomTextField(
                  obscureText: RegisterCubit.get(context).isPassword,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  }, icon: Icon(Icons.visibility)),
                  controller: RegisterCubit.get(context).passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                  title: 'Password',
                  hintText: 'Enter your Password'

              ),
              CustomTextField(
                  obscureText: RegisterCubit.get(context).isPassword,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: () {
                    RegisterCubit.get(context).changePasswordVisibility();
                  }, icon: Icon(Icons.visibility)),
                  controller: RegisterCubit.get(context).confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter confirm password';
                    }
                    return null;
                  },
                  title: 'Confirm Password',
                  hintText: 'Enter confirm password'

              ),
            ],
          ),
        );
      },
    );
  }
}
