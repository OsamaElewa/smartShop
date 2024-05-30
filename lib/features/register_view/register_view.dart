import 'package:flutter/material.dart';
import 'package:smart_shop/features/register_view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RegisterViewBody(),
    );
  }
}
