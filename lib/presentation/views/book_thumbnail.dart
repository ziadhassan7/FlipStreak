import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class BookThumbnail extends StatelessWidget {
  const BookThumbnail({Key? key, required this.filePath, this.page = 0}) : super(key: key);

  final String filePath;
  final int page;

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(8)), //cuz rounded

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,

          child: FutureBuilder(
              future: getImage(),
              builder: (context, AsyncSnapshot<PdfPageImage?> snapshot) {

                // data is ready
                if(snapshot.hasData) {

                  PdfPageImage image = snapshot.data!;
                  return Image.memory(image.bytes, fit: BoxFit.fitHeight, width: 200, height: 300,);

                  // loading
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }

              }
          ),

        ),
      ),
    );
  }


  Future<PdfDocument> getPdfFile() async {
    return await PdfDocument.openFile(filePath);
  }

  Future<PdfPage> getPage(PdfDocument document) async {
    if(document.pagesCount == 1){
      return await document.getPage(1);
    }
    return await document.getPage(page +1);
  }

  Future<PdfPageImage?> getPdfImage(PdfPage page) async {
    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.jpeg,
      quality: 10,
      backgroundColor: '#ffffff',

      // Crop rect in image for render
      //cropRect: Rect.fromLTRB(left, top, right, bottom),
    );

    return pageImage;
  }


  Future<PdfPageImage?> getImage() async {
    final document = await getPdfFile();

    final page = await getPage(document);

    final image = await getPdfImage(page);

    return image;
  }

}

