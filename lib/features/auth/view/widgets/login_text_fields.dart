import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/utils/components/dialogs.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/auth/view/bloc/authentication_bloc.dart';
import 'package:tazkar/features/auth/view/widgets/custom_input_field.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({super.key, required this.authBloc});

  final AuthenticationBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          LoadingDialog.show(context: context);
        } else {
          LoadingDialog.hide();
        }
        if (state is AuthenticationLoginSuccess) {
          context.toNamed(AppRoutes.home);
        }

        if (state is AuthenticationRegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: AutofillGroup(
        child: Form(
          key: authBloc.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                  validator: AppFunctions.validateEmail,
                  controller: authBloc.emailController,
                  label: context.tr.email,
                  hintText: context.tr.enterEmail,
                  autofillHints: [AutofillHints.email],
                  isPassword: false),
              const SizedBox(height: 20),
              CustomInputField(
                  validator: AppFunctions.validatePassword,
                  controller: authBloc.passwordController,
                  label: context.tr.password,
                  autofillHints: [AutofillHints.password],
                  hintText: context.tr.enterPassword,
                  isPassword: true),
            ],
          ),
        ),
      ),
    );
  }
}
