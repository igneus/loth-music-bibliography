XML=lothmusicbibliography.xml
SCHEMA=https://docbook.org/xml/5.0/rng/docbook.rng

all: validate

validate:
	jing $(SCHEMA) $(XML)
