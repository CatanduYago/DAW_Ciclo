<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Alumnos de Castelar</title>
        <style>
          h1 {
            font-size: 40px;
          }

          table {
            border-collapse: collapse;
            width: 100%;
          }

          th {
            font-family: Impact, sans-serif;
            font-size: 20px;
            color: red;
            text-align: left;
            padding: 5px;
            border: 1px solid #ddd;
          }

          td {
            font-weight: bolder;
            color: blue;
            text-align: left;
            padding: 5px;
            border: 1px solid #ddd;
          }
        </style>
      </head>
      <body>
        <h1>Alumnos de Castelar</h1>

        <table>
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Edad</th>
              <th>Ciclo</th>
              <th>Curso</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="alumnos/alumno">
              <tr>
                <td><xsl:value-of select="nombre"/></td>
                <td><xsl:value-of select="edad"/></td>
                <td><xsl:value-of select="ciclo"/></td>
                <td><xsl:value-of select="curso"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>