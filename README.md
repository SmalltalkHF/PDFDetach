# PDFDetach
Smalltalk package for extracting content, especially embedded files, from pdf-files, written for Pharo. 

The following code gives you the first embedded file as a bytearray
(PDFDocument readFrom: 'yourfile.pdf') getEmbeddedFile
