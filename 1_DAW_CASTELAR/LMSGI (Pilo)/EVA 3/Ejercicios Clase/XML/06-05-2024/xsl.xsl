<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/libreria">
    <h1>Librería</h1>
    <table>
        <tr>
          <th>Autor</th>
          <th>Título</th>
          <th>ISBN</th>
          <th>Precio</th>
        </tr>

        <xsl:for-each select="xml/libro">
          <tr>
            <td><xsl:value-of select="autor"/></td>
            <td><xsl:value-of select="titulo"/></td>
            <td><xsl:value-of select="ISBN"/></td>
            <td><xsl:value-of select="precio" format-number="#,##.00"/>€</td> </tr>
        </xsl:for-each>
x
    </table>
  </xsl:template>

</xsl:stylesheet>
