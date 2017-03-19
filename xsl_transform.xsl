<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" standalone="no" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<meta name="description" content="Robot Data"/>
				<meta name="author" content="Gunathilaka D.D.T.M."/>
				<link rel="icon" href="http://lh3.googleusercontent.com/-69UBa0KQ6Cg/AAAAAAAAAAI/AAAAAAAAACo/ZWxDxkQA4fg/s120-c/photo.jpg"/>
				<title>Robot Data</title>
			</head>
			<body>
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-3">Robot Data</h1>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div id="list_group" class="col-md-7">
							<div class="panel panel-default">
								<div class="panel-heading"><h4><i class="fa fa-tag fa-lg"></i>Room Data For Robot</h4></div>
								<div class="panel-body">
									<div class="row">
										<div class="col-md-12">
											<div class="list-group">
												<xsl:for-each select="room/surface">
													<a href="#" class="list-group-item" data-toggle="collapse" data-target="#thushan" data-parent="#list_group">
														<xsl:attribute name="data-target">
															<xsl:value-of select="concat('#',@id)" />
														</xsl:attribute>
														<xsl:if test="@type='roof' and @direction='up'">
															<xsl:text>Roof</xsl:text>
														</xsl:if>
														<xsl:if test="@type='wall' and @direction='left'">
															<xsl:text>Left Wall</xsl:text>
														</xsl:if>
														<xsl:if test="@type='wall' and @direction='right'">
															<xsl:text>Right Wall</xsl:text>
														</xsl:if>
														<xsl:if test="@type='wall' and @direction='front'">
															<xsl:text>Front Wall</xsl:text>
														</xsl:if>
														<xsl:if test="@type='wall' and @direction='back'">
															<xsl:text>Back Wall</xsl:text>
														</xsl:if>
														<span style="width:10px;"></span>
														<span class="label label-info"><xsl:value-of select="count(objects/object)"/></span>
														<span style="width:10px;"></span>
														<span class="label label-info" style="background-color: #000 !important;" >
															<xsl:attribute name="style">
																<xsl:value-of select="concat('background-color: ',paint,';color:#555;')" />
															</xsl:attribute>
															Surface Color : <xsl:value-of select="paint" />    
														</span>
														<span class="glyphicon glyphicon-arrow-left pull-right">
															<xsl:attribute name="class">
																<xsl:if test="@direction='up'">
																	<xsl:text>glyphicon glyphicon-triangle-top pull-right</xsl:text>
																</xsl:if>
																<xsl:if test="@direction='left'">
																	<xsl:text>glyphicon glyphicon-arrow-left pull-right</xsl:text>
																</xsl:if>
																<xsl:if test="@direction='right'">
																	<xsl:text>glyphicon glyphicon-arrow-right pull-right</xsl:text>
																</xsl:if>
																<xsl:if test="@direction='front'">
																	<xsl:text>glyphicon glyphicon-arrow-up pull-right</xsl:text>
																</xsl:if>
																<xsl:if test="@direction='back'">
																	<xsl:text>glyphicon glyphicon-arrow-down pull-right</xsl:text>
																</xsl:if>
															</xsl:attribute>
														</span>							
													</a>
													<div id="#thushan" class="sublinks collapse in">
														<xsl:attribute name="id">
															<xsl:value-of select="@id" />
														</xsl:attribute>
														<xsl:for-each select="objects/object">
															<a class="list-group-item small"><span class="glyphicon glyphicon-chevron-right"></span>
																<xsl:if test=".!=''"><xsl:value-of select="." /><xsl:value-of select="intensity/@measure" /><xsl:if test="intensity/@measure='W'"> Bulb</xsl:if></xsl:if>
																<xsl:if test="@id!=''">     ID : <xsl:value-of select="@id" /></xsl:if>
																<xsl:if test="@type!=''">     Type : <xsl:value-of select="@type" /></xsl:if>
																<xsl:if test="@distance!='' and @measure!=''">     Distance : <xsl:value-of select="@distance" /><xsl:value-of select="@measure" /></xsl:if>
															</a>
														</xsl:for-each>
													</div>
												</xsl:for-each>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr/>
				<style>
			body {
			  padding-bottom: 2rem;
			}
				</style>
				<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
				<!-- IE10 viewport fix for Surface/desktop Windows 8 bug -->
				<script>
				(function () {
					'use strict';
					if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
						var msViewportStyle = document.createElement('style')
						msViewportStyle.appendChild(
							document.createTextNode(
								'@-ms-viewport{width:auto!important}'
							)
						)
					document.head.appendChild(msViewportStyle)
					}
				})();
				</script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>