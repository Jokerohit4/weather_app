


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/application/bloc/auth/auth_bloc.dart';
import 'package:weather_app/application/bloc/auth/auth_event.dart';
import 'package:weather_app/utils/constants/string_constants.dart';
import 'package:weather_app/utils/extension/extension.dart';

class LoginViewModel {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  void signIn(BuildContext context ) {
    validateMailAndPassword(context)
    ?     BlocProvider.of<AuthBloc>(context).add(AuthRequested(email:_emailController.text,password: _passwordController.text))
        : null;
  }

 bool validateMailAndPassword(BuildContext context){
    String email = _emailController.text;
    String password = _passwordController.text;
    if(email.isEmpty || email.contains("@") || email.contains(".") ||  password.length< 10)
      {
      context.showError(StringConstants.emailPasswordError);
      return false;
      }
    return true;
  }

}
