<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:umbc="http://userpages.umbc.edu/~peshave1/CMSC691/HW2/courseSchedule.xsd"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">


  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="http://userpages.umbc.edu/~peshave1/CMSC691/HW2/courseSchedule.css"/>
        <title>Course Schedule</title>
      </head>
      <body>
        <center>
          <table class="mainTable">
            <tr class="pageHeaderRow">
              <td>
                <!--page title-->
                <table style="width:100%;">
                  <tr>
                    <td>
                      <h2>
                        UMBC COURSE SCHEDULE - <xsl:value-of select="//@semester"/>, <xsl:value-of select="//@year"/>
                      </h2>
                    </td>
                    <td class="subjectCareerStyle">
                      <h3>
                        <xsl:value-of select="//@courseSubject"/>
                        <br/>
                        <xsl:value-of select="//@courseCareer"/>
                      </h3>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
            <!--row 3...N : courses listing with each's sections nested inside-->
            <xsl:for-each select="descendant::umbc:course">
              <tr>
                <td>
                  <center>
                    <table class="courseTable">
                      <tr style="font-weight:bold">
                        <td class="courseTableDetailsRow">
                          <xsl:value-of select="@courseCode"/> : <xsl:value-of select="umbc:courseTitle"/>
                        </td>
                      </tr>

                      <tr>
                        <td style="padding-left:20px; width:160px">
                          <table border="1px" cellspacing="0px" cellpadding="0" class="sectionTable">
                            <tr class="sectionTableHeader">
                              <td colspan="2">Section ID</td>
                              <td>Days &amp; Time</td>
                              <td>Location</td>
                              <td>Instructor</td>
                              <td>Meeting Dates</td>
                            </tr>
                            <xsl:for-each select="umbc:sections/umbc:section">
                              <tr class="sectionTableDetailsRow">
                                <xsl:choose>
                                  <xsl:when test="umbc:status='Closed'">
                                    <xsl:attribute name="style">color:GrayText;</xsl:attribute>
                                  </xsl:when>
                                </xsl:choose>
                                <td class="sectionStatusCell">
                                  <xsl:choose>
                                    <xsl:when test="umbc:status='Open'">
                                      <xsl:attribute name="style">background-color:#9ef37c;</xsl:attribute>
                                      O
                                    </xsl:when>
                                    <xsl:when test="umbc:status='Closed'">
                                      <xsl:attribute name="style">background-color:#0094ff;</xsl:attribute>
                                      C
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:attribute name="style">background-color:#ffd800;</xsl:attribute>
                                      W
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  
                                </td>
                                <td style="border-left:none;">
                                  <xsl:value-of select="umbc:sectionId/umbc:sectionNumber"/>
                                  -
                                  <xsl:value-of select="umbc:sectionId/umbc:sectionType"/>
                                  -
                                  <xsl:value-of select="umbc:sectionId/umbc:classNumber"/>
                                  <xsl:choose>
                                    <xsl:when test="umbc:topic!=''">
                                      <br/>
                                      Topic : <xsl:value-of select="umbc:topic"/>
                                    </xsl:when>
                                  </xsl:choose>
                                </td>
                                <td style="width:150px;">
                                  <xsl:choose>
                                    <xsl:when test="umbc:day = 'TBD'">TBD</xsl:when>
                                    <xsl:otherwise>
                                      <xsl:for-each select="umbc:day">
                                        <xsl:value-of select="current()"/>
                                      </xsl:for-each>
                                      <br/>
                                      <xsl:value-of select="umbc:startTime"/> - <xsl:value-of select="umbc:endTime"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </td>
                                <td style="width:210px;">
                                  <xsl:choose>
                                    <xsl:when test="umbc:location/umbc:building = 'TBD'">TBD</xsl:when>
                                    <xsl:otherwise>
                                      <xsl:value-of select="umbc:location/umbc:building"/>-<xsl:value-of select="umbc:location/umbc:room"/>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </td>
                                <td style="width:150px;">
                                  <xsl:value-of select="umbc:instructor"/>
                                </td>
                                <td style="width:130px;">
                                  <xsl:value-of select="umbc:meetingStartDate"/> to <br/> <xsl:value-of select="umbc:meetingEndDate"/>
                                </td>
                              </tr>
                            </xsl:for-each>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </center>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </center>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
