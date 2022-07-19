import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  final String? imageUrl;
  const FullScreen({Key? key, this.imageUrl}) : super(key: key);

  @override
  State createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Colors.white10,
          child: Image.network(
            widget.imageUrl ?? 'default',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// InkWell(
//   onTap: () async {
//     // final tempDir = await getTemporaryDirectory();
//     // String tempPath = '${tempDir.path}/myfile.jpg';
//     // await Dio().download(widget.imageUrl ?? 'Default', tempPath);
//     await GallerySaver.saveImage(widget.imageUrl ?? 'default');
//
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //     const SnackBar(content: Text('Downoaded to Gallery')));
//   },
//   child: Container(
//     height: 60,
//     width: double.infinity,
//     color: Colors.blueGrey,
//     child: const Center(
//       child: Text(
//         'Set Wallpaper',
//         style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//       ),
//     ),
//   ),
// ),
