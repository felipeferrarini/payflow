import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow/pages/barcode/barcode_status.dart';

class BarcodeController extends GetxController {
  Rx<BarcodeStatus> statusGetx = BarcodeStatus().obs;
  BarcodeStatus get status => statusGetx.value;
  set status(BarcodeStatus status) => statusGetx.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  InputImage? imagePicker;

  CameraController? cameraController;

  @override
  void onInit() {
    // getAvailableCameras();
    // statusGetx.listen((value) {
    //   if (value.hasBarcode) {
    //     Get.offNamed('/insert_boleto', arguments: value.barcode);
    //   }
    //   if (value.hasError) {
    //     print(value.error);
    //   }
    // });
    // super.onInit();
  }

  @override
  void dispose() {
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
    super.dispose();
  }

  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );
      cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController!.initialize();
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeStatus.error(e.toString());
    }
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      var barcode;
      for (Barcode item in barcodes) {
        barcode = item.value.displayValue;
      }

      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeStatus.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }

      return;
    } catch (e) {
      print("ERRO DA LEITURA $e");
    }
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void scanWithCamera() {
    status = BarcodeStatus.available();
    Future.delayed(Duration(seconds: 5)).then((value) {
      if (status.hasBarcode == false)
        status = BarcodeStatus.error("Timeout de leitura de boleto");
    });
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false)
      cameraController!.startImageStream(
        (cameraImage) async {
          if (status.stopScanner == false) {
            try {
              final WriteBuffer allBytes = WriteBuffer();
              for (Plane plane in cameraImage.planes) {
                allBytes.putUint8List(plane.bytes);
              }
              final bytes = allBytes.done().buffer.asUint8List();
              final Size imageSize = Size(
                cameraImage.width.toDouble(),
                cameraImage.height.toDouble(),
              );
              final InputImageRotation imageRotation =
                  InputImageRotation.Rotation_0deg;
              final InputImageFormat inputImageFormat =
                  InputImageFormatMethods.fromRawValue(
                          cameraImage.format.raw) ??
                      InputImageFormat.NV21;
              final planeData = cameraImage.planes.map(
                (Plane plane) {
                  return InputImagePlaneMetadata(
                    bytesPerRow: plane.bytesPerRow,
                    height: plane.height,
                    width: plane.width,
                  );
                },
              ).toList();

              final inputImageData = InputImageData(
                size: imageSize,
                imageRotation: imageRotation,
                inputImageFormat: inputImageFormat,
                planeData: planeData,
              );
              final inputImageCamera = InputImage.fromBytes(
                bytes: bytes,
                inputImageData: inputImageData,
              );
              scannerBarCode(inputImageCamera);
            } catch (e) {
              print(e);
            }
          }
        },
      );
  }
}
