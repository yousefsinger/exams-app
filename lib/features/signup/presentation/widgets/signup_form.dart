import 'package:exam_app/core/widgets/custom_elevated_button.dart';
import 'package:exam_app/core/widgets/custom_text_link.dart';
import 'package:exam_app/core/widgets/custome_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_routes.dart';
import '../cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        final v = state is SignUpValidation ? state : SignUpValidation();
        final isLoading = state is SignUpLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Username ──────────────────────────────────────────────
            CustomTextField(
              label: 'User name',
              hint: 'Enter you user name',
              controller: _usernameController,
              errorText: v.usernameError,
              onChanged: (val) => cubit.onUsernameChanged('$val'),
            ),

            // ── First name & Last name ────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      onChanged: (val) => cubit.onFirstNameChanged(val),
                      decoration: InputDecoration(
                        labelText: 'First name',
                        hintText: 'Enter first name',
                        errorText: v.firstNameError,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      onChanged: (val) => cubit.onLastNameChanged(val),
                      decoration: InputDecoration(
                        labelText: 'Last name',
                        hintText: 'Enter last name',
                        errorText: v.lastNameError,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Email ─────────────────────────────────────────────────
            CustomTextField(
              label: 'Email',
              hint: 'Enter you email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              errorText: v.emailError,
              onChanged: (val) => cubit.onEmailChanged('$val'),
            ),

            // ── Password & Confirm Password ───────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: v.obscurePassword,
                      onChanged: (val) => cubit.onPasswordChanged(
                          val, _confirmPasswordController.text),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        errorText: v.passwordError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            v.obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 18.r,
                            color: Colors.grey,
                          ),
                          onPressed: cubit.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: v.obscureConfirmPassword,
                      onChanged: (val) => cubit.onConfirmPasswordChanged(
                          val, _passwordController.text),
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        hintText: 'Confirm password',
                        errorText: v.confirmPasswordError,
                        suffixIcon: IconButton(
                          icon: Icon(
                            v.obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 18.r,
                            color: Colors.grey,
                          ),
                          onPressed: cubit.toggleConfirmPasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Phone number ──────────────────────────────────────────
            CustomTextField(
              label: 'Phone number',
              hint: 'Enter phone number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              errorText: v.phoneError,
              onChanged: (val) => cubit.onPhoneChanged('$val'),
            ),

            // ── Signup Button ────────────────────────────────────────
            CustomElevatedButton(
              text: isLoading ? 'Loading...' : 'Signup',
              isValid: !isLoading,
              onPressed: () => cubit.signUp(
                username: _usernameController.text,
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                password: _passwordController.text,
                confirmPassword: _confirmPasswordController.text,
                phone: _phoneController.text,
              ),
            ),

            // ── Already have an account ───────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                CustomTextLink(
                  text: 'Login',
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.login,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }
}



