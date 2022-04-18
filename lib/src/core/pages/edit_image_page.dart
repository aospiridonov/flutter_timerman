import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_timerman/src/core/widgets/app_bar_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class EditImagePage extends StatefulWidget {
  const EditImagePage({
    Key? key,
    required this.imageUrl,
    this.onChanged,
  }) : super(key: key);

  final String imageUrl;
  final ValueChanged<String>? onChanged;

  @override
  State<EditImagePage> createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  String _imagePath = '';
  ImageProvider? _imageProvider;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.imageUrl;
    _imageProvider = _imagePath.contains('https://')
        ? NetworkImage(_imagePath)
        : FileImage(File(_imagePath)) as ImageProvider;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
            ),
            //color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            width: 330,
            child: Text(
              'Upload an image:',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 330,
              child: GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    await _compressAndUpdate(image);
                    //final compressedFile = await _compressAndGetFile(image);
                    //_imageProvider = null;
                    //setState(() {});
                    //if (compressedFile != null) {
                    //  _updateImage(compressedFile.absolute.path);
                    //}
                  }
                },
                child: Image(
                  image: _imageProvider ??
                      const AssetImage("assets/images/background.jpg"),
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 330,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onChanged!(_imagePath);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<File?> _compressAndGetFile(XFile? file) async {
    final dir = await path_provider.getTemporaryDirectory();
    final result = await FlutterImageCompress.compressAndGetFile(
      file!.path,
      '${dir.absolute.path}/avatar.jpg',
      quality: 90,
      minWidth: 480,
      minHeight: 480,
    );
    return result;
  }

  Future<void> _compressAndUpdate(XFile? file) async {
    final dir = await path_provider.getTemporaryDirectory();
    final imageFile = await FlutterImageCompress.compressAndGetFile(
      file!.path,
      '${dir.absolute.path}/${file.name}.jpg',
      quality: 90,
      minWidth: 480,
      minHeight: 480,
    );
    //return result;
    if (imageFile == null) {
      return;
    }

    //imageCache!.evict(imageFile);
    setState(() {
      _imagePath = imageFile.absolute.path;
      _imageProvider = FileImage(imageFile);
    });
  }
}
