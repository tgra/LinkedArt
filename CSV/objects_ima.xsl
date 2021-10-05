<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" encoding="utf-8" indent="no" />
    
    <xsl:template match="/"><xsl:text>type</xsl:text><xsl:apply-templates select="table[@name='ecatalogue']/tuple"></xsl:apply-templates>
        
    </xsl:template>
    
     
    
    <xsl:template match="tuple">
        <xsl:if test="position()=1">
        <xsl:call-template name="header"  />
        </xsl:if>
        <xsl:call-template name="body" /></xsl:template>
    
   
    
    <xsl:template name="header"  >
        <xsl:for-each select="atom">
        <xsl:choose>
            <xsl:when test="@name='irn'"><xsl:text>,id,identified_by/Identifier[0]/content,identified_by/Identifier[0]/id</xsl:text></xsl:when>
         <!--   <xsl:when test="@name='TitMainTitle'">,identified_by/Name[0]/content</xsl:when> 
            <xsl:when test="@name='TitAccessionNo'">,identified_by/Identifier[1]/content,identified_by/Identifier[1]/label,identified_by/Identifier[0]/id</xsl:when>
            <xsl:when test="@name='TitMainTitle'">,identified_by/Name[0]/content,identified_by/Name[0]/classified_as/id,identified_by/Name[0]/classified_as/type,identified_by/Name[0]/classified_as/_label</xsl:when> 

            <xsl:otherwise>
                
            </xsl:otherwise>-->
        </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="body">
        <xsl:for-each select="atom">
        <xsl:choose>
            <xsl:when test="@name='irn'">
            <xsl:text>
"HumanMadeObject",</xsl:text><xsl:value-of select="."/>,<xsl:value-of select="."/>,https://data.discovernewfields.org/object/<xsl:value-of select="."/></xsl:when>
           <!-- <xsl:when test="@name='TitMainTitle'">,identified_by/Name[0]/content</xsl:when> 
            <xsl:when test="@name='TitAccessionNo'">,identified_by/Identifier[1]/content,identified_by/Identifier[1]/label,identified_by/Identifier[0]/id</xsl:when>
            <xsl:when test="@name='TitMainTitle'">,identified_by/Name[0]/content,identified_by/Name[0]/classified_as/id,identified_by/Name[0]/classified_as/type,identified_by/Name[0]/classified_as/_label</xsl:when> 
            -->
            <xsl:otherwise>
                
            </xsl:otherwise>
        </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="table">
        
        
    </xsl:template>
    
</xsl:stylesheet>