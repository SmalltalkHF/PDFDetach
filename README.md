# PDFDetach
Smalltalk package for extracting content, especially embedded files, from pdf-files, written for Pharo 13. 

The following code gives you all embedded files as collection of bytearrays

(PDFDocument readFrom: 'yourfile.pdf') getEmbeddedFiles
