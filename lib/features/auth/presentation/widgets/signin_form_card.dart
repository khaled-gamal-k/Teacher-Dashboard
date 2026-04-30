import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teacher_dashboard/core/extensions/context_extensions.dart';
import 'package:teacher_dashboard/shared/widgets/feadback/hover_widgets.dart';
import 'package:teacher_dashboard/shared/widgets/feadback/loading_widget.dart';
import 'package:teacher_dashboard/features/auth/presentation/cubit/auth_state.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/strings_extensions.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_icon.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../core/utils/app_text_style.dart';
import '../cubit/auth_cubit.dart';

class SignInFormCard extends StatefulWidget {
  const SignInFormCard({super.key});

  @override
  State<SignInFormCard> createState() => _SignInFormCardState();
}

class _SignInFormCardState extends State<SignInFormCard> {
  final _autovalidateMode = ValueNotifier<AutovalidateMode>(.disabled);
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _isObscure = ValueNotifier<bool>(true);
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();

  void _toggleObscure() => _isObscure.value = !_isObscure.value;

  void _submit() {
    if (!_key.currentState!.validate()) {
      _autovalidateMode.value = .always;
      return;
    }
    context.read<AuthCubit>().signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _autovalidateMode.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _isObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          failure: (failure) => context.showSnackBar(message: failure),
          orElse: () => null,
        );
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        final isLoading = state.maybeWhen(loading: () => true, orElse: () => false);
        return SizedBox(
          width: context.isDesktop
              ? context.width * .35
              : context.isTablet
              ? context.width * .5
              : context.width * .85,
          child: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: _autovalidateMode,
                builder: (context, value, _) {
                  return Card(
                    child: Form(
                      key: _key,
                      autovalidateMode: value,
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          // * SIGNIN HEADERS
                          ..._buildSignInHeaders(context),
                          40.height,

                          // * EMAIL FIELD
                          _buildEmailField(context, cubit),
                          30.height,

                          // * PASSWORD FIELD
                          _buildPasswordField(context, cubit),
                          30.height,

                          // * FORGOT PASSWORD
                          Align(
                            alignment: .centerEnd,
                            child: GestureDetector(
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style: AppTextStyles.body19Regular.copyWith(
                                  color: AppColors.primaryAccent,
                                ),
                              ),
                            ),
                          ),
                          30.height,

                          // * SIGNIN BUTTON
                          HoverScaleOpacity(
                            opacity: 1,
                            child: AppButton(title: 'تسجيل الدخول', onPressed: _submit),
                          ),

                          // * FOOTER
                          30.height,
                          Text(
                            '© ${DateTime.now().year} نظام إدارة الأكاديمية. جميع الحقوق محفوظة',
                            style: AppTextStyles.body16Regular.copyWith(
                              color: AppColors.textSecondary.withValues(alpha: .7),
                            ),
                          ),
                        ],
                      ).paddingSym(h: 50, v: 50),
                    ),
                  );
                },
              ),

              //? LOADING OVERLAY
              if (isLoading) const Positioned.fill(child: AppLoading()),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSignInHeaders(BuildContext context) => [
    const AppIcon(icon: FontAwesomeIcons.database, padding: 20, size: 65),
    20.height,
    Text('نظام إدارة الأكاديمية', style: AppTextStyles.heading28Bold),
    20.height,
    Text(
      'قم بتسجيل الدخول للوصول إلى لوحة التحكم',
      style: AppTextStyles.body19Regular.copyWith(color: AppColors.textSecondary),
    ),
  ];

  Widget _buildPasswordField(BuildContext context, AuthCubit cubit) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text('كلمة المرور', style: AppTextStyles.body19Bold),
        ValueListenableBuilder(
          valueListenable: _isObscure,
          builder: (_, value, _) {
            return AppTextField(
              controller: _passwordController,
              prefixIcon: Icons.lock_outline_rounded,
              hintText: '••••••••••',
              validator: (val) {
                if (val.isNullOrEmpty) return 'يرجى إدخال كلمة المرور';
                if (val!.length < 6) return 'يجب أن تكون 6 أحرف على الأقل';
                return null;
              },
              isPassword: value,
              focusNode: _passwordFocusNode,
              suffixIcon: IconButton(
                icon: Icon(
                  value ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textSecondary,
                ),
                onPressed: _toggleObscure,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context, AuthCubit cubit) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Text('البريد الالكتروني', style: AppTextStyles.body19Bold),
        AppTextField(
          controller: _emailController,
          prefixIcon: Icons.email_outlined,
          hintText: 'admin@example.com',
          focusNode: _emailFocusNode,
          validator: (val) {
            if (val.isNullOrEmpty) return 'يرجى إدخال البريد الإلكتروني';
            if (!val.isEmail) return 'بريد إلكتروني غير صالح';
            return null;
          },
        ),
      ],
    );
  }
}
