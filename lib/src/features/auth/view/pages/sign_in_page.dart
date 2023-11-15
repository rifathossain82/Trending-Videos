import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_videos/src/core/extensions/build_context_extension.dart';
import 'package:trending_videos/src/core/helpers/validators.dart';
import 'package:trending_videos/src/core/services/agora_chat_services.dart';
import 'package:trending_videos/src/core/services/navigation_services.dart';
import 'package:trending_videos/src/core/widgets/k_button.dart';
import 'package:trending_videos/src/core/widgets/k_text_form_field_builder.dart';
import 'package:trending_videos/src/features/chat/bloc/chat_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userIdTextController = TextEditingController();
  final signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: signInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              KTextFormFieldBuilder(
                controller: userIdTextController,
                validator: Validators.emptyValidator,
                labelText: 'User ID',
                hintText: 'Enter your user id',
                inputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              KButton(
                onPressed: _signIn,
                child: Text(
                  'Sign In',
                  style: context.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    if (signInFormKey.currentState!.validate()) {
      await AgoraChatService.signIn(userId: userIdTextController.text)
          .then((value) {
        NavigationService.pop();
        BlocProvider.of<ChatBloc>(context).add(UpdateSignedInStatus());
      });
    }
  }
}
