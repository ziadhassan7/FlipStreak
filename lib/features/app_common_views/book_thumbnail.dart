import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart' as epub;
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:pdfx/pdfx.dart';

class BookThumbnail extends StatefulWidget {
  const BookThumbnail({Key? key, required this.filePath, this.page = 0}) : super(key: key);

  final String filePath;
  final int page;

  @override
  BookThumbnailState createState() => BookThumbnailState();
}

class BookThumbnailState extends State<BookThumbnail> {
  epub.EpubController? epubController;
  Image? pdfThumbnailImage;
  late bool isEpub;

  @override
  void initState() {
    super.initState();

    isEpub = widget.filePath.endsWith('.epub');

    if(isEpub){
      createEpubThumbnail();
    }
  }


  Future<Image> createPdfThumbnail() async {
    final document = await PdfDocument.openFile(widget.filePath);
    final page = await document.getPage(widget.page + 1); // PDF page indexing starts at 1
    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.jpeg,
      quality: 10,
    );

    await page.close();
    await document.close();

    return pdfThumbnailImage = Image.memory(pageImage!.bytes, fit: BoxFit.fill, width: 200, height: 300);

  }

  void createEpubThumbnail() {
    epubController = epub.EpubController();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          child: isEpub ? _buildEpubView() : _buildPdfView(),
        ),
      ),
    );
  }

  Widget _buildPdfView(){
    return FutureBuilder(
        future: createPdfThumbnail(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data!;
          } else {
            return const CircularProgressIndicator();
          }
        }
    );
  }

  Widget _buildEpubView() {
    return SizedBox(
      width: 200,
      height: 300,
      child: IgnorePointer( //this widget is to disable scrolling and touch events
        child: epub.EpubViewer(
          epubSource: EpubSource.fromFile(File(widget.filePath)),
          epubController: epubController!,

          onEpubLoaded: (){
            epubController!.toProgressPercentage(widget.page.toDouble());
          },
        ),
      ),
    );
  }
}

