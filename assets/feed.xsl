<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
<xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/rss/channel">
<html lang="en">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>RSS Feed — <xsl:value-of select="title"/></title>
<style>
  body{font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;max-width:640px;margin:60px auto;padding:0 20px;color:#1a1a2e;background:#fff;line-height:1.6}
  h1{font-size:1.6rem;margin-bottom:4px}
  .subtitle{color:#666;font-size:.9rem;margin-bottom:32px}
  .card{border:1px solid #e1e4e8;border-radius:8px;padding:16px 20px;margin-bottom:12px}
  .card h3{font-size:1rem;margin:0 0 4px}
  .card h3 a{color:#1a1a2e;text-decoration:none}
  .card h3 a:hover{color:#7c6ff0}
  .card .date{font-size:.8rem;color:#888;font-family:monospace}
  .actions{margin-top:24px;display:flex;gap:12px;flex-wrap:wrap}
  .btn{display:inline-block;padding:8px 20px;border-radius:6px;font-size:.9rem;text-decoration:none;font-weight:500;transition:all .15s}
  .btn-primary{background:#7c6ff0;color:#fff}
  .btn-primary:hover{background:#6755e0}
  .btn-secondary{background:#f6f8fa;color:#1a1a2e;border:1px solid #e1e4e8}
  .btn-secondary:hover{background:#e1e4e8}
  .footer{margin-top:40px;padding-top:20px;border-top:1px solid #e1e4e8;font-size:.8rem;color:#888}
  .url-box{background:#f6f8fa;border:1px solid #e1e4e8;border-radius:6px;padding:10px 14px;font-family:monospace;font-size:.8rem;word-break:break-all;margin-top:8px}
</style>
</head>
<body>
  <h1><xsl:value-of select="title"/></h1>
  <p class="subtitle">RSS Feed — <xsl:value-of select="count(item)"/> posts</p>

  <xsl:for-each select="item">
    <div class="card">
      <h3><a href="{link}"><xsl:value-of select="title"/></a></h3>
      <span class="date"><xsl:value-of select="pubDate"/></span>
    </div>
  </xsl:for-each>

  <div class="actions">
    <a class="btn btn-primary" href="{link}">Visit Site</a>
    <a class="btn btn-secondary" href="{atom:link[@rel='self']/@href}">Raw XML</a>
  </div>

  <div class="footer">
    <p>To subscribe, copy the URL below and paste it into your RSS reader:</p>
    <div class="url-box"><xsl:value-of select="atom:link[@rel='self']/@href"/></div>
  </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>