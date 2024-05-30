import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: LoginCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                  controller: LoginCubit.get(context).userNameController,
                  prefixIcon: Icon(Icons.email),
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
                  obscureText: LoginCubit.get(context).isPassword,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(onPressed: () {
                  LoginCubit.get(context).changePasswordVisibility();
                }, icon: Icon(Icons.visibility)),
                  controller: LoginCubit.get(context).passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your password';
                    }
                    return null;
                  },
                  title: 'Password',
                  hintText: 'Enter your Password'

              ),
            ],
          ),
        );
      },
    );
  }
}
