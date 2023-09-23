import 'dart:io';

import 'package:camera/camera.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_challenge/constants/Gaps.dart';
import 'package:tiktok_challenge/constants/Sizes.dart';
import 'package:tiktok_challenge/features/video/video_write_screen.dart';
import 'package:tiktok_challenge/features/video/view_models/upload_video_vm.dart';

class WriteScreen extends ConsumerStatefulWidget {
  final String? title;

  const WriteScreen({Key? key, this.title}) : super(key: key);

  @override
  WriteScreenState createState() => WriteScreenState();
}

class WriteScreenState extends ConsumerState<WriteScreen> {
  String _thread = "";
  XFile? _photoFile;

  final TextEditingController _threadController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _threadController.addListener(() {
      setState(() {
        _thread = _threadController.text;
      });
    });
  }

  void _pushToCamera(BuildContext context) async {
    XFile? returnedPhoto = await Navigator.of(context).push<XFile>(
      MaterialPageRoute(
        builder: (context) => const VideoRecordingScreen(),
      ),
    );

    if (returnedPhoto != null) {
      // 사진을 성공적으로 받아왔으면 상태를 업데이트합니다.
      setState(() {
        _photoFile = returnedPhoto;
      });
    }
  }

  Future<void> _onPickVideoPressed() async {
    final video = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (video == null) return;

    if (!mounted) return;
    setState(() {
      _photoFile = video;
    });
  }

  Future<void> _upload() async {
    if (_photoFile == null) return;

    File file = File(_photoFile!.path);
    ref.read(uploadVideoProvider.notifier).uploadVideo(file, context, _thread);

    setState(() {});

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final thisSize = MediaQuery.of(context).size;

    return Container(
      height: thisSize.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size20),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Report'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                const Divider(color: Colors.black45, height: 0.3, thickness: 3),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            foregroundImage: NetworkImage(
                              faker.image.image(
                                keywords: ['actors'],
                                random: true,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  VerticalDivider(
                                    width: Sizes.size40,
                                    thickness: Sizes.size3,
                                    color: Colors.grey.shade300,
                                    indent: Sizes.size12,
                                    endIndent: Sizes.size12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 15,
                            foregroundImage: NetworkImage(
                              faker.image.image(
                                keywords: ['actors'],
                                random: true,
                                width: 10,
                                height: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gaps.h16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "jane_mobbin",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: TextField(
                                controller: _threadController,
                                style: const TextStyle(
                                  color: Colors.black45,
                                ),
                                decoration: const InputDecoration(
                                  hintText: '텍스트를 입력해주세요',
                                  border: InputBorder.none,
                                )),
                          ),
                          Gaps.v10,
                          GestureDetector(
                            // onTap: () => _pushToCamera(context),
                            onTap: _onPickVideoPressed,
                            child: const FaIcon(
                              FontAwesomeIcons.paperclip,
                              color: Colors.black38,
                              size: Sizes.size16,
                            ),
                          ),
                          _photoFile == null
                              ? const SizedBox()
                              : Image.file(
                                  width: 30, height: 60, File(_photoFile!.path))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              width: thisSize.width,
              // height: thisSize.height,
              // width: MediaQuery.of(context).size,
              child: BottomAppBar(
                surfaceTintColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                    vertical: Sizes.size10,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text("anyone can reply"),
                      ),
                      GestureDetector(
                        onTap: _upload,
                        child: Text(
                          "Post",
                          style: TextStyle(
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w600,
                            color:
                                _thread.length > 8 ? Colors.blue : Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
