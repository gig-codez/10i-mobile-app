import 'dart:developer';
import 'dart:io';

import "/exports/exports.dart";

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  bool isScanningMode = true;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool isFlashOn = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Routes.routeTo(Routes.resultPage),
      //   child: const Icon(Icons.arrow_forward),
      // ),
      body: Stack(
        children: <Widget>[
          isScanningMode ? _buildQrView(context) : _buildQrDisplay(context),
          Positioned(
            top: 40,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BackButton(
                        color: Colors.white,
                        onPressed: () {
                          Routes.pop();
                        },
                      ),
                      const SizedBox(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFlashOn = !isFlashOn;
                            controller!.toggleFlash();
                          });
                        },
                        icon: Icon(
                          isFlashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: isScanningMode
                              ? "Scan QR Code"
                              : "QR Code Display",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                        ),
                        TextSpan(
                          text: isScanningMode
                              ? "\nPlace the camera box at the QR Code to scan."
                              : "\nYour QR code is displayed below.",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                                fontSizeFactor: 1.2,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isScanningMode = !isScanningMode;
          });
        },
        child: Icon(isScanningMode ? Icons.qr_code_scanner : Icons.qr_code),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Theme.of(context).primaryColor,
          overlayColor: Colors.black87,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Widget _buildQrDisplay(BuildContext context) {
    return PaymentInfo();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      String? out = scanData.code;
      if (out != null) {
        Routes.replacePage(ResultPage(
          user: int.parse(out),
        ));
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No Permission'),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
