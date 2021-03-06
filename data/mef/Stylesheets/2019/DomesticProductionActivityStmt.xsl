<?xml version="1.0" encoding="UTF-8"?>
<!--Created by Doug peterson 6-26-2006--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/DomesticProductionActivityStmt"/>
  
  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
  
    <!-- Itemized Other Income Schedule Data -->
    <table id="DependencyDataTbl" class="styDepTbl">
    <!--  <thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" scope="col">Statement</th>         
         
                                                                                 
      </tr>
      </thead>-->
        <tfoot/>
        
       <tbody>
      <xsl:for-each select="$DependencyData/DomesticProdActivityItemGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
                              
       <td class="styDepTblCell" style="text-align:left">      		
          <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Domestic production gross receipts:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./DomesticProductionGroRcptsAmt"/>
            </xsl:call-template>
          </div>                  
        </div>
        <br/>
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Gross receipts from all sources:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./GrossReceiptsFromAllSourcesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Cost of goods sold allocable to DPGR:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./CostGoodsSoldAllocableDPGRAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Cost of goods sold from all sources:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./CostGoodsSoldFromAllSourcesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Total deductions, expenses, and losses directly allocable to DPGR:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./TotDedExpnssLossAllcblDPGRAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
	
	<div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Total deductions, expenses and losses directly allocable to a non-DPGR class of income:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./TotDedLossAllcblNonDPGRAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Other deductions, expenses and losses not directly allocable to DPGR or another class of income:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./OthDedLossNotAllcblDPGRAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Form W-2 wages:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./W2WagesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
	</td>
      </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
          <title><xsl:value-of select="$depDocTitle"/></title>

         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
         <meta name="Author" content="Jason Iozzo"/>
         <meta name="Description" content="{$depDocTitle}"/> 
                
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
           
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>
          
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:68mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
                
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>