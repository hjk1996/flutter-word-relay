import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/common/set_photo_dialog.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';

class UserProfileSetting extends StatefulWidget {
  const UserProfileSetting({super.key});

  @override
  State<UserProfileSetting> createState() => _UserProfileSettingState();
}

class _UserProfileSettingState extends State<UserProfileSetting> {
  late StreamSubscription<AuthScreenEvent> _streamSubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<AuthScreenViewModel>();

    _streamSubscription = viewModel.eventStream.listen(
      (event) {
        event.when(
          onAuthError: (String message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
          onSignInSuccess: () {},
          onProfileSettingDone: () async {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  '회원가입이 완료되었습니다.\n이메일 인증 후 이용해주세요.\n인증 메일을 찾을 수 없는 경우 스팸 메일함을 확인해주세요.',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            );
            if (!mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreenView(),
              ),
            );
          },
          onSignUpSuccess: () async {},
          onProfileTap: () async {
            if (!mounted) return;
            final action = await showDialog<SetPhotoAction>(
              context: context,
              builder: (context) => const SetPhotoDialog(),
            );
            if (action == SetPhotoAction.camera) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();
                viewModel.image = imageBytes;
              }
            } else if (action == SetPhotoAction.gallery) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();

                viewModel.image = imageBytes;
              }
            } else if (action == SetPhotoAction.remove) {
              viewModel.image = null;
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AuthScreenViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 사진 설정'),
        actions: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<AuthScreenViewModel>(
                builder: (context, value, child) => GestureDetector(
                  onTap: context.read<AuthScreenViewModel>().onProfileTap,
                  child: ClipOval(
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircleAvatar(
                            backgroundImage: value.state.image != null
                                ? MemoryImage(value.state.image!)
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            color: Colors.grey.withOpacity(0.4),
                            width: 150,
                            height: 25,
                            child: const Text(
                              '편집',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<AuthScreenViewModel>(
                    builder: (context, vm, child) {
                      return vm.state.isLoading
                          ? const CircularProgressIndicator()
                          : Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                onPressed: vm.state.image != null
                                    ? vm.updateUserPhoto
                                    : null,
                                child: const Text('프로필 사진 등록'),
                              ),
                            );
                    },
                  ),
                  Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: ElevatedButton(
                      onPressed: viewModel.skipProfileImage,
                      child: const Text('생략'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
