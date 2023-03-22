<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="html" indent="yes"/>

    
    <!-- VARIABLES : PAGES -->
    
    <xsl:variable name="contexte">
        <xsl:value-of select="concat('contexte','.html')"/>
    </xsl:variable>
    <xsl:variable name="return_contexte">
        <a href="contexte.html"/>
    </xsl:variable>
    
    <xsl:variable name="acteI">
        <xsl:value-of select="concat('acteI','.html')"/>
    </xsl:variable>
    <xsl:variable name="return_acteI">
        <a href="acteI.html"/>
    </xsl:variable>
    
    <xsl:variable name="acteII">
        <xsl:value-of select="concat('acteII','.html')"/>
    </xsl:variable>
    <xsl:variable name="return_acteII">
        <a href="acteII.html"/>
    </xsl:variable>
    
    <xsl:variable name="notes">
        <xsl:value-of select="concat('notes','.html')"/>
    </xsl:variable>
    <xsl:variable name="return_notes">
        <a href="notes.html"/>
    </xsl:variable>
    
    <!-- VARIABLES: TEXTE RECURRENT -->
    
    <xsl:variable name="head">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Électre, Jean Giraudoux et les Chartes</title>
        
    </xsl:variable>

    <xsl:variable name="footer">
       <p><xsl:value-of select="//editionStmt/p"/></p>
    </xsl:variable>
    
    <!-- TEMPLATES SUPPLEMENTAIRES -->
    
    <xsl:template name="footnote" match="//note">
        <xsl:for-each select=".">
        <xsl:element name="sup">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:text>$notes</xsl:text>
                </xsl:attribute>
                <xsl:number count="//note" level="any" format="1"/>
            </xsl:element>
        </xsl:element></xsl:for-each>
    </xsl:template>    
    
    <xsl:template name="w" match="//w">
        <xsl:for-each select=".">
            <xsl:element name="a"> 
                <xsl:attribute name="href">
                    <xsl:value-of select="./@function"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>w</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="pc" match="//pc">
        <xsl:for-each select=".">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="./@ana"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>pc</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="emph" match="//emph">
        <xsl:for-each select=".">
            <xsl:element name="a">
                <xsl:attribute name="href">
                <xsl:value-of select="./@corresp"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>emph</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="seg" match="//seg">
        <xsl:for-each select=".">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="./@ana"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:text>seg</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="."/>               
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <!-- BUILD -->
    
    <xsl:template match="/">
        <xsl:call-template name="contexte"/>
        <xsl:call-template name="acteI"/>
        <xsl:call-template name="acteII"/>
        <xsl:call-template name="notes"/>
    </xsl:template>
    
    <!-- PAGE CONTEXTE -->
    
    <xsl:template name="contexte">
        <xsl:result-document href="{$contexte}" method="html" indent="yes">
            <html lang="fr">
                
                <head><xsl:copy-of select="$head"></xsl:copy-of>
                    <link rel="stylesheet" type="text/css" href="electre_morestyles.css"></link></head>
                
                <body>
                    
                    <header>
                        <p>Électre, Drama &amp; TEI</p> 
                        <nav>
                            <a href="./{$contexte}">Contexte</a>
                            <a href="./{$acteI}">Acte I</a>
                            <a href="./{$acteII}">Acte II</a>
                            <a href="./{$notes}">Notes</a>
                           
                        </nav>
                    </header>
                    
                    <h1 class="h1">Éléments sur l'histoire</h1>
                    
                    <div class="pageSection">

                        <h2>Personnages</h2>
                       
                        <ul>
                            <ol class="listTitle"><xsl:value-of select="//listPerson/comment()[position()=1]"/></ol>
                            <xsl:for-each select="//listPerson/person[position()=1 to 8]/persName">
                                <li><xsl:apply-templates/>
                                <xsl:if test="./following-sibling::note">
                                    <xsl:for-each select=".">
                                        <xsl:call-template name="footnote"/></xsl:for-each>
                                </xsl:if>
                                </li>
                  
                            </xsl:for-each>
                        </ul>
                        <ul>
                            <ol class="listTitle"><xsl:value-of select="//listPerson/comment()[position()=2]"/></ol>
                            <xsl:for-each select="//listPerson/person[position()=9 to 13]/persName">
                                <li><xsl:apply-templates/>
                                    <xsl:if test="./following-sibling::note">
                                        <xsl:for-each select="./following-sibling::note">
                                            <xsl:call-template name="footnote"/></xsl:for-each>
                                    </xsl:if></li>
                            </xsl:for-each>
                        </ul>
                        <ul>
                            <ol class="listTitle"><xsl:value-of select="//listPerson/comment()[position()=3]"/></ol>
                            <xsl:for-each select="//listPerson/person[position()=14 to 15]/persName">
                                <li><xsl:apply-templates/>
                                    <xsl:if test="./following-sibling::note">
                                        <xsl:for-each select="./following-sibling::note">
                                            <xsl:call-template name="footnote"/></xsl:for-each>
                                    </xsl:if></li>
                            </xsl:for-each>
                        </ul>
                        <ul>
                            <ol class="listTitle"><xsl:value-of select="//listPerson/comment()[position()=4]"/></ol>
                            <xsl:for-each select="//listPerson/person[last()]/persName">
                                <li><xsl:apply-templates/>
                                    <xsl:if test="./following-sibling::note">
                                        <xsl:for-each select="./following-sibling::note">
                                            <xsl:call-template name="footnote"/></xsl:for-each>
                                    </xsl:if></li>
                            </xsl:for-each>
                        </ul></div>
                    
                    <div class="pageSection">

                        <h2>Arbre généalogique des Atrides</h2>
                        <img src="atrides.png" alt="Schéma fort verbeux avec beaucoup de flèches emmêlées" 
                            title="Nos personnages et leur ascendance divine."/>
                    </div> 
                        <!-- On devrait mettre une table des relations là, mais on y arrive pas --> 
                </body>
                <footer><xsl:copy-of select="$footer"/></footer>
            </html>    
        </xsl:result-document>
    </xsl:template>
    
    <!-- PAGE TEXTE 1 -->
    
    <xsl:template name="acteI">
        <xsl:result-document href="{$acteI}" method="html" indent="yes">
            <html lang="fr">
                
                <head><xsl:copy-of select="$head"></xsl:copy-of>
                    <link rel="stylesheet" type="text/css" href="electre_morestyles.css"></link></head>
                
                <body>
                    
                    <header>
                        <p>Électre, Drama &amp; TEI</p> 
                        <nav>
                            <a href="./{$contexte}">Contexte</a>
                            <a href="./{$acteI}">Acte I</a>
                            <a href="./{$acteII}">Acte II</a>
                            <a href="./{$notes}">Notes</a>                            
                        </nav>
                    </header>
                    
                    <div>
                 
                        <!-- set --> <p class="stage" style="text-align:center; font-size:0.9em;">
                           <xsl:value-of select="//front//p"/></p></div>
                    
                    <!-- Acte --><h1 class="h1">
                        <xsl:value-of select="//body/div1[@n='1']/head"/></h1>
                        
                        <!-- Scène --><div class="pageSection">
                            <h2>
                                <xsl:value-of select="//div2[@n='1']/head"/></h2>
                            <h3>Scène d'exposition</h3>
                           
                   <!-- Répliques -->
                        <p class="stage">
                            <xsl:value-of select="//div2[@n='1']/stage[position()=1]"/></p>
                      
                        <xsl:for-each select="//div2[@n='1']/sp">
                  
                            <xsl:for-each select="./speaker">
                                <p class="speaker">
                                    <xsl:apply-templates/></p>
                            </xsl:for-each>
                            <xsl:for-each select="./stage">
                                <p class="stage">
                                    <xsl:apply-templates/></p>
                            </xsl:for-each>
                            <xsl:for-each select="./p">
                                <p class="lines">
                                    <xsl:apply-templates/>
                                    
                                        <xsl:if test="./parent::sp/following-sibling::note">
                                    <xsl:call-template name="footnote"/></xsl:if>
                                        <xsl:if test="not(./parent::sp/following-sibling::note)">
                                            <xsl:text> </xsl:text>
                                        </xsl:if>                                
                                    </p></xsl:for-each>
                            
                            
                        </xsl:for-each>   

                       <p class="stage">
                            <xsl:apply-templates select="//div2[@n='1']/stage[last()]"/></p>                                                  
                   </div>
                </body>
                
                <footer><xsl:copy-of select="$footer"/></footer>
            </html>    
        </xsl:result-document>
    </xsl:template>
    
    <!-- PAGE TEXTE 2 -->
    
    <xsl:template name="acteII">
        <xsl:result-document href="{$acteII}" method="html" indent="yes">
            <html lang="fr">
                
                <head>
                    <xsl:copy-of select="$head"></xsl:copy-of>
                    <link rel="stylesheet" type="text/css" href="electre_morestyles.css"></link></head>
                
                <body>
                    
                    <header>
                        <p>Électre, Drama &amp; TEI</p> 
                        <nav>
                            <a href="./{$contexte}">Contexte</a>
                            <a href="./{$acteI}">Acte I</a>
                            <a href="./{$acteII}">Acte II</a>
                            <a href="./{$notes}">Notes</a>
                        </nav>
                    </header>
                
                    <!-- Acte --><h1 class="h1">
                        <xsl:value-of select="//div1[@n='2']/head"/></h1>
                        
                        <!-- Scène --><div class="pageSection">
                            
                            <h2>
                                <xsl:value-of select="//div2[@n='9']/head"/></h2>
                            <h3>Avant-dernière scène</h3>  
                      
                            <p class="castlist">
                                <xsl:value-of select="//div2[@n='9']/castList"/></p>
                            
                          <!-- Répliques et didascalies -->  
 
                              <xsl:for-each select="//div2[@n='9']/sp[position()=1 to 4]">
                                  <xsl:for-each select="./speaker">
                                      <p class="speaker">
                                          <xsl:apply-templates/></p>
                                  </xsl:for-each>
                                  <xsl:for-each select="./p">
                                      <p class="lines">
                                          <xsl:apply-templates/>
                                          <xsl:call-template name="footnote"/></p>
                                  </xsl:for-each>
                              </xsl:for-each>   
                              
                              <p class="stage">
                                  <xsl:value-of select="//div2[@n='9']/stage[position()=1]"/></p>
                              
                              <xsl:for-each select="//div2[@n='9']/sp[position()=5]">
                                  <xsl:for-each select="./speaker">
                                      <p class="speaker">
                                          <xsl:apply-templates/></p>
                                  </xsl:for-each>
                                  <xsl:for-each select="./p">
                                      <p class="lines">
                                          <xsl:apply-templates/>
                                          <xsl:call-template name="footnote"/></p>
                                  </xsl:for-each>
                              </xsl:for-each>
                              
                              <p class="stage">
                               <xsl:value-of select="//div2[@n='9']/stage[position()=2]"/></p>
                              
                              <xsl:for-each select="//div2[@n='9']/sp[position()=6 to 13]">
                                  <xsl:for-each select="./speaker">
                                      <p class="speaker">
                                          <xsl:apply-templates/></p>
                                  </xsl:for-each>
                                  <xsl:for-each select="./p">
                                      <p class="lines">
                                          <xsl:apply-templates/>
                                          <xsl:call-template name="footnote"/></p>
                                  </xsl:for-each>
                              </xsl:for-each>
               
                              <p class="stage">
                                  <xsl:value-of select="//div2[@n='9']/stage[position()=3]"/></p>
                              
                              <xsl:for-each select="//div2[@n='9']/sp[position()=14 to 34]">
                                  <xsl:for-each select="./speaker">
                                      <p class="speaker"><xsl:apply-templates/></p>
                                  </xsl:for-each>
                                   <xsl:for-each select="./stage">
                                      <p class="stage"><xsl:apply-templates/></p>
                                  </xsl:for-each>
                                  <xsl:for-each select="./p">
                                      <p class="lines">
                                          <xsl:apply-templates/>
                                          <xsl:call-template name="footnote"/></p>
                                  </xsl:for-each>
                              </xsl:for-each>                        
                        </div>
                        
                     <!-- Scène --> <div class="pageSection">

                            <h2>
                                <xsl:value-of select="//div1[@n='2']/div2[@n='10']/head"/></h2>
                            <h3>Dernière scène</h3>
                         
                        <!-- Castlist --> <p class="castlist">
                            <xsl:value-of select="//div1[@n='2']/div2[@n='10']/castList"/></p>
                         
                         <p class="stage">
                             <xsl:value-of select="//div2[@n='10']/stage[position()=1]"/></p>
                         
                        <!-- Répliques -->
                            <xsl:for-each select="//div2[@n='10']/sp">
                                <xsl:for-each select="./speaker">
                                    <p class="speaker">
                                        <xsl:apply-templates/></p>
                                </xsl:for-each>
                                <xsl:for-each select="./p">
                                    <p class="lines">
                                        <xsl:apply-templates/>
                                        <xsl:call-template name="footnote"/></p>
                                </xsl:for-each>
                            </xsl:for-each>
                           
                            <p class="stage">
                                <xsl:value-of select="//div2[@n='10']/stage[last()]"/></p>              
                     </div>
                </body>

                <footer><xsl:copy-of select="$footer"/></footer>
            </html>    
        </xsl:result-document>
    </xsl:template>
    
    <!-- PAGE NOTES -->
        
        <xsl:template name="notes">
            <xsl:result-document href="{$notes}" method="html" indent="yes">
                <html lang="fr">
 
                    <head><xsl:copy-of select="$head"></xsl:copy-of>
                        <link rel="stylesheet" type="text/css" href="electre_morestyles.css"></link></head> 
                    
                    <!-- Footnotes -->
                    <body>
                        
                        <header>
                            <p>Électre, Drama &amp; TEI</p> 
                            <nav>
                                <a href="./{$contexte}">Contexte</a>
                                <a href="./{$acteI}">Acte I</a>
                                <a href="./{$acteII}">Acte II</a>
                                <a href="./{$notes}">Notes</a>
                            </nav>
                        </header>
                        
                        <h1 class="h1">Ressources complémentaires</h1>
                        <div class="pageSection">
                            <h2>Notes</h2>
                            
                            <xsl:for-each select="//note">
                                <p>
                                    <xsl:number count="//note" level="any" format="1"></xsl:number>
                                    <xsl:text>. </xsl:text>
                                    <xsl:value-of select="."/></p>
                            </xsl:for-each>
                        </div>
                    
                    <!-- Base de données succincte -->
                        
                    <div class="pageSection">

                        <table>
                            <caption>Pour commencer à comparer les dénominations des personnages</caption>
                         
                            <thead><tr>
                                <td></td>
                                <td class="pers2">Électre</td>
                                <td class="pers1">Oreste</td>
                                <td class="pers2">Agamemnon</td>
                                <td class="pers1">Clytemnestre</td>
                                <td class="pers2">Les Euménides</td>
                                <td class="pers1">Égisthe</td>
                                <td class="pers2">Le Jardinier</td>
                                <td class="pers1">Le Mendiant</td>
                                <td class="pers2">La Femme Narsès</td>
                            </tr></thead>
                            <tbody>
                            <tr><th class="thead">Nombre de mentions nominales</th>
                                <td class="t2"><xsl:value-of select="count(//persName[@ref='#el'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persName[@ref='#o'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persName[@ref='#agm'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persName[@ref='#cly'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persName[@ref='#em1 #em2 #em3'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persName[@ref='#eg'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persName[@ref='#jd'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persName[@ref='#mdt'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persName[@ref='#fns'])"/></td></tr>
                            
                            <tr><th class="thead">Nombre de mentions pronominales</th>
                                <td class="t2"><xsl:value-of select="count(//persPronouns[@corresp='#el'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persPronouns[@corresp='#o'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persPronouns[@corresp='#agm'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persPronouns[@corresp='#cly'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persPronouns[@corresp='#em1 #em2 #em3'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persPronouns[@corresp='#eg'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persPronouns[@corresp='#jd'])"/></td>
                                <td class="t1"><xsl:value-of select="count(//persPronouns[@corresp='#mdt'])"/></td>
                                <td class="t2"><xsl:value-of select="count(//persPronouns[@corresp='#fns'])"/></td></tr>
                            
                            <tr><th class="thead">Pronoms</th>
                                <td class="td2">
                                    <xsl:for-each select="//persPronouns[@corresp='#el']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td1">
                                    <xsl:for-each select="//persPronouns[@corresp='#o']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td2">
                                    <xsl:for-each select="//persPronouns[@corresp='#agm']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td1">
                                    <xsl:for-each select="//persPronouns[@corresp='#cly']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td2">
                                    <xsl:for-each select="//persPronouns[@corresp='#em1 #em2 #em3']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td1">
                                    <xsl:for-each select="//persPronouns[@corresp='#eg']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td2">
                                    <xsl:for-each select="//persPronouns[@corresp='#jd']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td1">
                                    <xsl:for-each select="//persPronouns[@corresp='#mdt']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                                <td class="td2">
                                    <xsl:for-each select="//persPronouns[@corresp='#fns']">
                                        <xsl:value-of select="."/><xsl:text>, </xsl:text>
                                    </xsl:for-each></td>
                            </tr>
                            <tr><th class="thead">Périphrases</th>
                                <td class="td2"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#el']">
                                     <ul class="listin">
                                        <xsl:for-each select="//persName[@type='périphrase' and @ref='#el']">
                                        <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td1"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#o']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#o']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td2"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#agm']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#agm']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td1"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#cly']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#cly']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td2"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#em1 #em2 #em3']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#em1 #em2 #em3']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td1"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#eg']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#eg']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td2"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#jd']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#jd']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td1"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#mdt']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#mdt']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                                <td class="td2"><xsl:choose>
                                    <xsl:when test="//persName[@type='périphrase' and @ref='#fns']">
                                        <ul class="listin">
                                            <xsl:for-each select="//persName[@type='périphrase' and @ref='#fns']">
                                                <li class="it"><xsl:value-of select="."/></li></xsl:for-each></ul></xsl:when>
                                    <xsl:otherwise><xsl:text>X</xsl:text></xsl:otherwise></xsl:choose></td>
                            </tr>
                        </tbody>
                    </table></div>
                    </body>
                        
                    <footer><xsl:copy-of select="$footer"/></footer>
                </html>    
            </xsl:result-document>
        </xsl:template>
 
</xsl:stylesheet>