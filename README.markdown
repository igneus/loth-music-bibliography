# Roman Catholic Liturgy of the Hours - Music #

Attempt to collect a comprehensive international bibliography
of sheet music for the Roman Catholic
[Liturgy of the Hours](https://en.wikipedia.org/wiki/Liturgy_of_the_Hours).

The main file, `lothmusicbibliography.xml`, is a DocBook 5.0 bibliography.
A simple XSL stylesheet is provided to view the bibliography
in a modern web browser.

The bibliography is available for viewing online at
http://www.inadiutorium.cz/bibliography/

## Validation

Run `make` in the project directory to validate the bibliography file
against a Relax NG schema.
(Requires the `jing` Relax NG validator.
Makes an HTTP request to retrieve schema definition from the internet.)
