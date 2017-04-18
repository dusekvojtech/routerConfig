<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <table class="center2">>
      <tr>
        <th>ID</th>
        <th>MAC Adress</th>
        <th>Receved Packets</th>
        <th>Sent Packets</th>
      </tr>
      <xsl:for-each select="routerConf/wireless/wirelessStatistics/statEntry[sentPackets >= 2000]">
        <xsl:sort select="sentPackets" order="descending"/>
          <xsl:choose>
            <xsl:when test="position()&lt;=3">
              <xsl:if test="position()=1">
                <tr class="gold">
                    <td>
                      <xsl:value-of select="@statId"/>
                    </td>
                    <td>
                      <xsl:value-of select="statMacAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="recevedPackets"/>
                    </td>
                    <td>
                      <xsl:value-of select="sentPackets"/>
                    </td>
                  </tr>
              </xsl:if>
              <xsl:if test="position()=2">
                <tr class="silver">
                    <td>
                      <xsl:value-of select="@statId"/>
                    </td>
                    <td>
                      <xsl:value-of select="statMacAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="recevedPackets"/>
                    </td>
                    <td>
                      <xsl:value-of select="sentPackets"/>
                    </td>
                  </tr>
              </xsl:if>
              <xsl:if test="position()=3">
                <tr class="bronze">
                    <td>
                      <xsl:value-of select="@statId"/>
                    </td>
                    <td>
                      <xsl:value-of select="statMacAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="recevedPackets"/>
                    </td>
                    <td>
                      <xsl:value-of select="sentPackets"/>
                    </td>
                  </tr>
              </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                  <tr>
                    <td>
                      <xsl:value-of select="@statId"/>
                    </td>
                    <td>
                      <xsl:value-of select="statMacAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="recevedPackets"/>
                    </td>
                    <td>
                      <xsl:value-of select="sentPackets"/>
                    </td>
                  </tr>
              </xsl:otherwise>
          </xsl:choose>
      </xsl:for-each>
    </table>
    <table class="center2">>
      <tr>
        <th>ID</th>
        <th>MAC Adress</th>
        <th>Desription</th>
        <th>Enable</th>
      </tr>
      <xsl:for-each select="routerConf/wireless/wirelessMacFiltering/macEntry">
        <xsl:sort select="status" order="descending"/>
          <xsl:choose>
            <xsl:when test="status = 'true'">
                <tr class="green">
                    <td>
                      <xsl:value-of select="@filtrId"/>
                    </td>
                    <td>
                      <xsl:value-of select="macAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="description"/>
                    </td>
                    <td>
                      <xsl:value-of select="status"/>
                    </td>
                  </tr>
              </xsl:when>
              <xsl:otherwise>
                  <tr class="red">
                    <td>
                      <xsl:value-of select="@filtrId"/>
                    </td>
                    <td>
                      <xsl:value-of select="macAdress"/>
                    </td>
                    <td>
                      <xsl:value-of select="description"/>
                    </td>
                    <td>
                      <xsl:value-of select="status"/>
                    </td>
                  </tr>
              </xsl:otherwise>
          </xsl:choose>
      </xsl:for-each>
    </table>
  </xsl:template>
</xsl:stylesheet>