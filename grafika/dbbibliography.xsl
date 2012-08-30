<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="bibliography/title"/></title>
	<link rel="stylesheet" type="text/css" href="grafika/dbbibliography.css"/>
      </head>

      <body>
	<xsl:apply-templates select="bibliography/title"/>
	<xsl:apply-templates select="bibliography/subtitle"/>
	<hr/>

	<xsl:apply-templates select="bibliography"/>
      </body>
    </html>
  </xsl:template>

  <!-- top level -->

  <xsl:template match="bibliography/title">
    <h1><xsl:value-of select="."/></h1>
  </xsl:template>

  <xsl:template match="bibliography/subtitle">
    <h2><xsl:value-of select="."/></h2>
  </xsl:template>

  <xsl:template match="bibliography">
    <xsl:apply-templates select="bibliodiv|biblioentry"/>
  </xsl:template>

  <!-- bibliodiv -->

  <xsl:template match="bibliodiv">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="bibliodiv/title">
    <h3><xsl:value-of select="."/></h3>
  </xsl:template>

  <!-- biblioentry -->

  <xsl:template match="biblioentry">
    <p>
      <xsl:if test="./author">
	<xsl:apply-templates select="author"/>
	<xsl:text>: </xsl:text>
      </xsl:if>

      <xsl:if test="./authorgroup">
	<xsl:apply-templates select="authorgroup"/>
	<xsl:text>: </xsl:text>
      </xsl:if>
      
      <span class="entrytitle">
	<xsl:apply-templates select="title"/>
	<xsl:if test="./subtitle">
	  <xsl:text>. </xsl:text>
	  <xsl:apply-templates select="subtitle"/>
	</xsl:if>
      </span>

      <xsl:if test="./publisher | ./copyright">
	<xsl:text>, </xsl:text>
      </xsl:if>

      <xsl:if test="./publisher">
	<xsl:if test="./publisher/address/city">
	  <xsl:value-of select="./publisher/address/city"/>
	  <xsl:if test="./publisher/publishername">
	    <xsl:text>: </xsl:text>
	  </xsl:if>
	</xsl:if>
	<xsl:if test="./publisher/publishername">
	  <xsl:value-of select="./publisher/publishername"/>
	</xsl:if>
      </xsl:if>

      <xsl:if test="./copyright">
	<xsl:text> </xsl:text>
	<xsl:value-of select="./copyright/year"/>
      </xsl:if>

      <xsl:text>.</xsl:text>
    </p>
  </xsl:template>

  <xsl:template match="author">
    <span class="authorsurname"><xsl:value-of select="./surname"/></span>
    <xsl:if test="./firstname">
      <xsl:text> </xsl:text>
      <xsl:value-of select="./firstname"/>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>