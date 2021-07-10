import 'package:camera/camera.dart';

class BarcodeStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeStatus({
    this.isCameraAvailable = false,
    this.cameraController,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeStatus.available(CameraController controller) => BarcodeStatus(
        isCameraAvailable: true,
        cameraController: controller,
      );

  factory BarcodeStatus.error(String message) => BarcodeStatus(error: message);

  factory BarcodeStatus.barcode(String barcode) =>
      BarcodeStatus(barcode: barcode);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
