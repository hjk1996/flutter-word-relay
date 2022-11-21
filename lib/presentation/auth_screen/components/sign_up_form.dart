import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final viewModel = context.read<AuthScreenViewModel>();
    _emailController.addListener(() {
      viewModel.setEmail = _emailController.text;
    });
    _passwordController.addListener(() {
      viewModel.setPassword = _passwordController.text;
    });
    _confirmPasswordController.addListener(() {
      viewModel.setConfirmPassword = _confirmPasswordController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<AuthScreenViewModel>();
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: 'e-mail'),
            controller: _emailController,
            validator: viewModel.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: AUTH_FORM_FILED_GAP,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'password'),
            controller: _passwordController,
            obscureText: true,
            validator: viewModel.validatePassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: AUTH_FORM_FILED_GAP,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'confirm password'),
            controller: _confirmPasswordController,
            obscureText: true,
            validator: viewModel.validateConfirmPassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: AUTH_FORM_FILED_GAP,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: viewModel.toggleAuthMode,
                child: const Text('이미 계정이 있어요'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<AuthScreenViewModel>(builder: (context, vm, child) {
            return ElevatedButton(
              onPressed: vm.isValid ? vm.onAuthButtonClick : null,
              child: const Text('계정 만들기'),
            );
          })
        ],
      ),
    );
  }
}
