XML=lothmusicbibliography.xml

all: validate

validate:
	xmllint --valid --noout $(XML)
