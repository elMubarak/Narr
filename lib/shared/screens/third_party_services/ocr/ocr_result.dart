// import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/widgets/cards/primary_card.dart';
import 'package:clipboard/clipboard.dart';

// ignore: must_be_immutable
class OcrResult extends StatefulWidget {
  final String imagePicked;
  final String selectedFile;
  Response response;
  Map headers;
  OcrResult(
      {required this.response,
      this.imagePicked = '',
      this.selectedFile = '',
      required this.headers});

  @override
  _OcrResultState createState() => _OcrResultState();
}

class _OcrResultState extends State<OcrResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Result',
                style: TextStyle(
                  color: Color(0xff00a368),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/png/ocr.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 15),
              PrimaryCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 8, bottom: 35, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade600.withOpacity(0.5),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {
                                  FlutterClipboard.copy(widget.response.data)
                                      .then(
                                    (value) => narrService.dialogInfoService
                                        .showToast('Text Copied'),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text('${widget.response.data}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // CustomBotton(
                    //   isLoading: false,
                    //   buttonTitle: 'Copy Text',
                    // onTap: () {
                    //   FlutterClipboard.copy(widget.response.data).then(
                    //     (value) => print('Copied'),
                    //   );
                    // },
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
