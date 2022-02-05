# Roman Catholic Liturgy of the Hours - Music #

Attempt to collect a comprehensive international bibliography
of musical scores for the Roman Catholic Liturgy of the Hours / Divine Office.

The main file, lothmusicbibliography.xml, is a DocBook 4.5 bibliography.
A simple XSL stylesheet is provided to view the bibliography 
in a modern web browser.

You can view the bibliography online:
http://www.inadiutorium.cz/bibliography/

## Validation

Run `make` in the project directory to validate the bibliography file
against DTD.
(Requires the `xmllint` utility, which is included in `libxml`.
Makes a HTTP request to retrieve the DTD from the internet.)
