<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Tabla de Opositores</title>
                <style>
                    h1 {
                        color: blue;
                        font-size: 30px;
                    }
                    th {
                        font-family: Impact;
                        color: red;
                    }
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }
                    th, td {
                        border: 1px solid black;
                        padding: 8px;
                        text-align: left;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h1>Tabla de Opositores</h1>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Especialidad</th>
                        <th>Nota</th>
                    </tr>
                    <xsl:for-each select="oposición/opositor">
                        <xsl:sort select="nota" order="descending"/>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="opositor">
        <tr>
            <td><xsl:value-of select="nombre"/></td>
            <td><xsl:value-of select="especialidad"/></td>
            <td><xsl:value-of select="nota"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
