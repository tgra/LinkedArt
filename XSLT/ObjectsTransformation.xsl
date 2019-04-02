<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="text"/>
    
    <xsl:variable name="baseURI">https://data.discovernewfields.org/</xsl:variable>
    <xsl:variable name="crm">http://www.cidoc-crm.org/cidoc-crm/</xsl:variable>

<xsl:template match="/">"objects": [
    <xsl:for-each select="table[@name='ecatalogue']/tuple">{<!--
Header-->
        "<xsl:value-of select="atom[@name='irn']"/>": {
            "@context": "https://linked.art/ns/v1/linked-art.json",
            "id": "<xsl:copy-of select="$baseURI"/>object/<xsl:value-of select="atom[@name='irn']"/>",
            "type": "ManMadeObject",
            "_label": "<xsl:value-of select="atom[@name='TitMainTitle']"/>",<!--
Classification-->
            "classified_as": [
                {
                    "id": "http://vocab.getty.edu/aat/300133025",
                    "type": "Type",
                    "_label": "works of art"
                }<xsl:if test="table[@name='ObjectTypes']/tuple/atom[@name='PhyMediaCategory'] != '' ">,<xsl:for-each select="table[@name='ObjectTypes']/tuple">
                {
                    "id": "<xsl:copy-of select="$baseURI"/>thesauri/type/<xsl:value-of select="lower-case(translate(atom[@name='PhyMediaCategory'], ' ', '-'))"/>",
                    "type": "Type",
                    "_label": "<xsl:value-of select="atom[@name='PhyMediaCategory']"/>"
                }<xsl:if test="position() != last()">,</xsl:if></xsl:for-each></xsl:if>
            ],<!--
Identifiers-->
            "identified_by": [
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/irn</xsl:text>",
                    "type": "Identifier",
                    "_label": "IMA at Newfields Collections Database Number for the Artwork",
                    "content": "<xsl:value-of select="atom[@name='irn']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300404621",
                            "type": "Type",
                            "_label": "repository numbers"
                        }
                    ]
                },
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/accession-number</xsl:text>",
                    "type": "Identifier",
                    "_label": "IMA at Newfields Accession Number for the Artwork",
                    "content": "<xsl:value-of select="atom[@name='TitAccessionNo']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300312355",
                            "type": "Type",
                            "_label": "accession numbers"
                        }
                    ]
                }<xsl:if test="atom[@name='TitPreviousAccessionNo'] != ''">,
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/old-accession-number</xsl:text>",
                    "type": "Identifier",
                    "_label": "Identifier Assigned to the Artwork by IMA at Newfields Prior to Accession",
                    "content": "<xsl:value-of select="atom[@name='TitPreviousAccessionNo']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300404626",
                            "type": "Type",
                            "_label": "identification numbers"
                        }
                    ]
                }</xsl:if>,<!--
Titles-->
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/title</xsl:text>",
                    "type": "Name",
                    "_label": "Primary Title for the Artwork",
                    "content": "<xsl:value-of select="atom[@name='TitMainTitle']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300404670",
                            "type": "Type",
                            "_label": "preferred terms"
                        }
                    ]
                }<xsl:if test="table[@name='AltTitles']">,<xsl:for-each select="table[@name='AltTitles']/tuple">
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/alt-title-</xsl:text><xsl:value-of select="position()"/>",
                    "type": "Name",
                    "_label": "Alternate Title for the Artwork",
                    "content": "<xsl:value-of select="atom[@name='TitAlternateTitles']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300417227",
                            "type": "Type",
                            "_label": "alternate titles"
                        }
                    ]
                }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
            </xsl:if><xsl:if test="atom[@name='TitSeriesTitle'] != ''">,
                {
                    "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/series-title</xsl:text>",
                    "type": "Name",
                    "_label": "Title of the Series of Works of which the Artwork is a Part",
                    "content": "<xsl:value-of select="atom[@name='TitSeriesTitle']"/>",
                    "classified_as": [
                        {
                            "id": "http://vocab.getty.edu/aat/300417214",
                            "type": "Type",
                            "_label": "series title"
                        }
                    ]
                }</xsl:if>
            ],<!--
Owner-->
            "current_owner": {
                "id": "http://vocab.getty.edu/ulan/500300517",
                "type": "Group",
                "_label": "Indianapolis Museum of Art at Newfields",
                "classified_as": [
                    {
                        "id": "http://vocab.getty.edu/aat/300312281",
                        "type": "Type",
                        "_label": "museums (institutions)"
                    }
                ],<!--
Acquisition-->
                "acquired_title_through": [
                    {
                        "id": "<xsl:copy-of select="$baseURI"/><xsl:text>object/</xsl:text><xsl:value-of select="atom[@name='irn']"/><xsl:text>/IMA-acquisition</xsl:text>",
                        "type": "Acquisition",
                        "_label": "Acquisition of <xsl:value-of select="atom[@name='TitMainTitle']"/>",
                        "classified_as": [
                            {
                                "id": "http://vocab.getty.edu/aat/300157782",
                                "type": "Type",
                                "_label": "acquisition (collections management)"
                            }
                        ]
                    }
                ]<!--
Current Location-->
            }<xsl:if test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'] != 'see related parts'"><xsl:choose><xsl:when test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1'] = 'On Loan'">,
            "current_location": {
                "id": "<xsl:copy-of select="$baseURI"/>thesauri/location/on-loan",
                "type": "Place",
                "_label": "On Loan"
            }</xsl:when><xsl:when test="contains(atom[@name='LocMovementType'], 'Exhibition') and tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel1'] != 'On Loan'">,
            "current_location": {
                "id": "<xsl:copy-of select="$baseURI"/>thesauri/location/<xsl:value-of select="lower-case(translate(tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'], ' ', '-'))"/>",
                "type": "Place",
                "_label": "<xsl:value-of select="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2']"/>"<xsl:if test="contains(lower-case(tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2']), 'gallery')">,
                "clasified_as": [
                    {
                        "id": "http://vocab.getty.edu/aat/300240057",
                        "type": "Type",
                        "_label": "galleries (display spaces)"
                    }
                ]</xsl:if>
            }</xsl:when><xsl:otherwise>,
            "current_location": {
                "id": "<xsl:copy-of select="$baseURI"/>thesauri/location/storage",
                "type": "Place",
                "_label": "IMA Storage"
            }</xsl:otherwise></xsl:choose></xsl:if><xsl:if test="tuple[@name='LocCurrentLocationRef']/atom[@name='LocLevel2'] = 'see related parts'">,
        </xsl:if>
        }
    }<xsl:if test="position() != last()">,
    </xsl:if>
        </xsl:for-each>
]</xsl:template>
</xsl:stylesheet>