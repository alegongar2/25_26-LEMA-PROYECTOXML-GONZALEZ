<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:variable name="iva" select="1.21"/>
    
    <xsl:template match="/tiendaMusica">
        <html lang="eu">
            <head>
                <meta charset="UTF-8"/>
                <title>Katalogoa - Albusa Music</title>
                <link rel="stylesheet" href="assets/css/main.css"/>
                <style>
                    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
                    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    img { max-width: 100px; height: auto; }
                    .oferta { color: red; font-weight: bold; }
                </style>
            </head>
            <body>
                
                <h1>Albusa Music Katalogoa</h1>
                
                <h2>Dendaren informazioa</h2>
                <p><strong>Izena:</strong> <xsl:value-of select="infoTienda/nombre"/></p>
                <p><strong>Helbidea:</strong> <xsl:value-of select="infoTienda/direccion"/></p>
                <p><strong>Telefonoa:</strong> <xsl:value-of select="infoTienda/telefono"/></p>
                <p><strong>Email:</strong> <xsl:value-of select="infoTienda/email"/></p>
                
                <p><strong>Katalogoko produktu kopurua guztira: </strong> 
                    <xsl:value-of select="count(//producto)"/>
                </p>
                
                <hr/>
                
                <xsl:for-each select="catalogo/categoria">
                    <h2>Kategoria: <xsl:value-of select="@nombre"/></h2>
                    
                    <table>
                        <tr>
                            <th>Irudia</th>
                            <th>ID</th>
                            <th>Izena</th>
                            <th>Artista</th>
                            <th>Salneurria</th>
                            <th>BEZarekin</th>
                            <th>Deskontua</th>
                            <th>Informazioa</th>
                        </tr>
                        
                        <xsl:for-each select="producto">
                            <tr>
                                <td>
                                    <img src="{imagen}" alt="{nombre}"/>
                                </td>
                                
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="artista"/></td>
                                
                                <td>
                                    <xsl:value-of select="precio"/> €
                                    <xsl:if test="precio &gt; 100">
                                        <span style="font-size:0.8em; color:grey"> (Premium)</span>
                                    </xsl:if>
                                </td>
                                
                                <td>
                                    <xsl:value-of select="format-number(precio * $iva, '0.00')"/> €
                                </td>
                                
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="descuento &gt; 0">
                                            <span class="oferta">
                                                -<xsl:value-of select="descuento"/>%
                                            </span>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            -
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                
                                <td>
                                    <a href="{url}" target="_blank">Ikusi</a>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>