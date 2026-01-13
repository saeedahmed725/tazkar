import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazkar/config/routes/app_routes.dart';
import 'package:tazkar/core/utils/components/dialogs.dart';
import 'package:tazkar/core/utils/extension/extension.dart';
import 'package:tazkar/core/utils/functions/functions.dart';
import 'package:tazkar/features/auth/view/bloc/authentication_bloc.dart';
import 'package:tazkar/features/auth/view/widgets/custom_input_field.dart';

class SignUpTextFields extends StatelessWidget {
  const SignUpTextFields({super.key, required this.authBloc});

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
        if (state is AuthenticationRegisterSuccess) {
          context.toNamedAndOffAll(AppRoutes.home);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                  label: context.tr.name,
                  hintText: context.tr.enterName,
                  validator: AppFunctions.validateName,
                  autofillHints: [AutofillHints.name],
                  controller: authBloc.nameController,
                  isPassword: false),
              const SizedBox(height: 20),
              CustomInputField(
                  label: context.tr.email,
                  hintText: context.tr.enterEmail,
                  validator: AppFunctions.validateEmail,
                  autofillHints: [AutofillHints.email],
                  controller: authBloc.emailController,
                  isPassword: false),
              const SizedBox(height: 20),
              CustomInputField(
                  label: context.tr.password,
                  hintText: context.tr.enterPassword,
                  validator: AppFunctions.validatePassword,
                  autofillHints: [AutofillHints.password],
                  controller: authBloc.passwordController,
                  isPassword: true),
            ],
          ),
        ),
      ),
    );
  }
}
