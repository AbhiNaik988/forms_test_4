import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_test_4/blocs/sign_in_bloc/sign_in_events.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/sign_in_bloc/sign_in_states.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Sign In"),
                background: Image.network(
                  "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  return _signInForm(state, context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _signInForm(SignInState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: state.isFormSubmitting
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _usernameTextField(context, state),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _passwordTextField(context, state),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  _submitButton(state, context),
                ],
              ),
      ),
    );
  }

  TextFormField _usernameTextField(BuildContext context, SignInState state) {
    return TextFormField(
      onChanged: (value) =>
          BlocProvider.of<SignInBloc>(context).add(UsernameChanged(value)),
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter Your Name",
        errorText: state.isUsernameValid ? null : state.usernameErrorText,
        suffixIcon: Icon(
          Icons.supervised_user_circle_rounded,
          color: state.isUsernameValid ? Colors.grey : Colors.red,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }

  TextFormField _passwordTextField(BuildContext context, SignInState state) {
    return TextFormField(
      obscureText: true,
      onChanged: (value) =>
          BlocProvider.of<SignInBloc>(context).add(PasswordChanged(value)),
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        errorText: state.isPasswordValid ? null : state.passwordErrorText,
        suffixIcon: Icon(
          Icons.remove_red_eye_sharp,
          color: state.isPasswordValid ? Colors.grey : Colors.red,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }

  ElevatedButton _submitButton(SignInState state, BuildContext context) {
    return ElevatedButton(
      onPressed: state.isPasswordValid && state.isUsernameValid
          ? () {
              BlocProvider.of<SignInBloc>(context).add(SignInSubmitting());
              FocusManager.instance.primaryFocus!.unfocus();
            }
          : null,
      child: const Text("Submit"),
    );
  }
}
