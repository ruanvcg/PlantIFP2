// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:image_picker/image_picker.dart';

// class DocumentosPage extends StatefulWidget {
//   const DocumentosPage({super.key});

//   @override
//   State<DocumentosPage> createState() => _DocumentosPageState();
// }

// class _DocumentosPageState extends State<DocumentosPage> {
//   List<CameraDescription> cameras = [];
//   CameraController? controller;
//   XFile? imagem;
//   Size? size;

//   @override
//   void initState() {
//     super.initState();
//     _loadCameras();
//   }

//   _loadCameras() async {
//     try {
//       _startCamera();
//     } on CameraException catch (e) {
//       print(e.description);
//     }
//   }

//   _startCamera() {
//     if (cameras.isEmpty) {
//       print('Câmera não encontrada');
//     } else {
//       _previewCamera(cameras.first);
//     }
//   }

//   _previewCamera(CameraDescription camera) async {
//     final CameraController cameraController = CameraController(
//       camera,
//       ResolutionPreset.medium,
//       enableAudio: false,
//       imageFormatGroup: ImageFormatGroup.jpeg,
//     );
//     controller = cameraController;

//     try {
//       await cameraController.initialize();
//     } on CameraException catch (e) {
//       print(e.description);
//     }

//     if (mounted) {
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Selecionar IMG'),
//         backgroundColor: Colors.grey[900],
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Container(
//         color: Colors.grey[900],
//         child: Center(
//           child: _arquivoWidget(),
//         ),
//       ),
//       floatingActionButton: (imagem != null)
//           ? FloatingActionButton.extended(
//               onPressed: () => Navigator.pop(context),
//               label: Text('Finalizar'),
//             )
//           : null,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   _arquivoWidget() {
//     return Container(
//       width: size!.width - 50,
//       height: size!.height - (size!.height / 3),
//       child: imagem == null
//           ? _cameraPreviewWidget()
//           : Image.file(File(imagem!.path), fit: BoxFit.contain),
//     );
//   }

//   _cameraPreviewWidget() {
//     final CameraController? cameraController = controller;

//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return Text('Widget para cámera que não tá disponivel');
//     } else {
//       return Stack(
//         alignment: AlignmentDirectional.bottomCenter,
//         children: [
//           CameraPreview(controller!),
//           _botaoCapituraWidget(),
//         ],
//       );
//     }
//   }

//   _botaoCapituraWidget() {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 24),
//       child: CircleAvatar(
//         radius: 32,
//         backgroundColor: Colors.black.withOpacity(0.5),
//         child: IconButton(
//           icon: Icon(
//             Icons.camera,
//             color: Colors.white,
//             size: 30,
//           ),
//           onPressed: tirarfoto,
//         ),
//       ),
//     );
//   }

//   tirarfoto() async {
//     final CameraController? cameraController = controller;

//     if (cameraController != null && !cameraController.value.isInitialized) {
//       try {
//         XFile file = await cameraController.takePicture();
//         if (mounted) setState(() => imagem = file);
//       } on CameraException catch (e) {
//         print(e.description);
//       }
//     }
//   }
// }
