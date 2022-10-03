<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:db="http://docbook.org/ns/docbook"
                version="1.0">

  <xsl:strip-space elements="db:authorgroup db:author"/>

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="db:bibliography/db:title"/></title>
        <link rel="stylesheet" type="text/css" href="grafika/dbbibliography.css"/>
      </head>

      <body>
        <xsl:apply-templates select="db:bibliography/db:title"/>
        <xsl:apply-templates select="db:bibliography/db:subtitle"/>
        <p class="tac">
          Know of a publication we are still missing?
          Please open an issue (or a PR) at
          <a href="https://github.com/igneus/loth-music-bibliography">Github</a>
          or send an e-mail to <a href="mailto:jkb.pavlik@gmail.com?subject=LOTH Music Bibliography">jkb.pavlik@gmail.com</a>.
        </p>
        <hr/>

        <xsl:apply-templates select="db:bibliography"/>
      </body>
    </html>
  </xsl:template>

  <!-- top level -->

  <xsl:template match="db:bibliography/db:title">
    <h1><xsl:value-of select="."/></h1>
  </xsl:template>

  <xsl:template match="db:bibliography/db:subtitle">
    <h2><xsl:value-of select="."/></h2>
  </xsl:template>

  <xsl:template match="db:bibliography">
    <xsl:copy>
      <xsl:apply-templates select="db:bibliodiv">
        <xsl:sort select="contains(db:title, 'Gregorian')" order="descending"/>
        <xsl:sort select="db:title" order="ascending"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

  <!-- bibliodiv -->

  <xsl:template match="db:bibliodiv">
    <xsl:apply-templates select="db:title"/>

    <xsl:for-each select="./db:biblioentry">
      <xsl:sort select="db:pubdate|db:biblioset/db:pubdate" order="descending"/>
      <xsl:apply-templates select="."/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="db:bibliodiv/db:title">
    <h3>
      <xsl:attribute name="id">
	<xsl:value-of select="translate(., ' ', '')"/>
      </xsl:attribute>
      <xsl:value-of select="."/>
    </h3>
  </xsl:template>

  <!-- biblioentry -->

  <xsl:template match="db:biblioentry">
    <p>
      <xsl:choose>
        <xsl:when test="./db:biblioset">
          <xsl:apply-templates select="./db:biblioset[@relation = 'issue']"/>
          <xsl:apply-templates select="./db:biblioset[@relation = 'journal']"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="biblioset_content"/>
        </xsl:otherwise>
      </xsl:choose>
    </p>
  </xsl:template>

  <xsl:template match="db:biblioset" name="biblioset_content">
    <xsl:if test="./db:author">
      <xsl:apply-templates select="db:author"/>
    </xsl:if>

    <xsl:if test="./db:authorgroup">
      <xsl:apply-templates select="db:authorgroup"/>
    </xsl:if>

    <xsl:if test="./db:editor">
      <xsl:apply-templates select="db:editor"/>
    </xsl:if>

    <xsl:if test="./db:author|./db:authorgroup|./db:editor">
      <xsl:text>: </xsl:text>
    </xsl:if>

    <span class="entrytitle">
      <xsl:apply-templates select="db:title"/>
      <xsl:if test="./db:subtitle">
        <xsl:text>. </xsl:text>
        <xsl:apply-templates select="db:subtitle"/>
      </xsl:if>
    </span>

    <xsl:if test="./db:publisher | ./db:pubdate">
      <xsl:text>, </xsl:text>
    </xsl:if>

    <xsl:if test="./db:publisher">
      <xsl:if test="./db:publisher/db:address/db:city">
        <xsl:value-of select="./db:publisher/db:address/db:city"/>
        <xsl:if test="./db:publisher/db:publishername">
          <xsl:text>: </xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:if test="./db:publisher/db:publishername">
        <xsl:value-of select="./db:publisher/db:publishername"/>
      </xsl:if>
    </xsl:if>

    <xsl:if test="./db:pubdate">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./db:pubdate"/>
    </xsl:if>

    <xsl:text>. </xsl:text>
  </xsl:template>

  <xsl:template match="db:authorgroup">
    <for-each select="./db:author">
      <xsl:apply-templates/>
      
    </for-each>
  </xsl:template>

  <xsl:template match="db:author|db:editor">
    <xsl:apply-templates select="./db:personname | ./db:orgname"/>
    <!-- dash between more authors in an authorgroup -->
    <xsl:if test="position() != last()">
      <xsl:text> - </xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="db:personname">
    <span class="authorsurname"><xsl:value-of select="./db:surname"/></span>
    <xsl:if test="./db:firstname">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./db:firstname"/>
    </xsl:if>
    <xsl:if test="./db:othername">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./db:othername"/>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
