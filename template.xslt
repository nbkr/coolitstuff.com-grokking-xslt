<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

  <xsl:output method="html" encoding="UTF-8" />

  <xsl:template match="article">
      <html>
          <head />
          <body>
              <h1><xsl:value-of select="content/@title" /></h1>
              <xsl:apply-templates select="authors" />
              <hr />
              <xsl:apply-templates select="content[1]" />
          </body>
      </html>
  </xsl:template>

  <xsl:template match="heading[@level=1]">
      <h2><xsl:value-of select='.' /></h2>
  </xsl:template>


  <xsl:template match="content"> 
      <div id="content">
          <xsl:apply-templates />
      </div>
  </xsl:template>

  <xsl:template match="images"> 
          <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="img"> 
      <img src="{./@file}" alt="{./label}" />
  </xsl:template>

  <xsl:template match="authors">
      <div id='authors'>
          <xsl:apply-templates />
      </div>
  </xsl:template>

  <xsl:template match="list/item">
      <li><xsl:value-of select='.' /></li>
  </xsl:template>

  <xsl:template match="list">
      <ul>
          <xsl:apply-templates />
      </ul>
  </xsl:template>

  <xsl:template match="list[@type='unordered']">
      <ul>
          <xsl:apply-templates />
      </ul>
  </xsl:template>

  <xsl:template match="list[@type='ordered']">
      <ol>
          <xsl:apply-templates />
      </ol>
  </xsl:template>


  <xsl:template match="author">
      <div id='author'>
          <a href='mailto:{./@email}'><xsl:value-of select='.' /></a><br />
      </div>
  </xsl:template>


</xsl:stylesheet>
