<html>
<head>
<meta charset="UTF-8">
<title>자료파일 | 패널데이터강의</title>
<link rel="stylesheet" type="text/css" href="../common.css" />
<style type="text/css">
 #list { font-family:Oxygen Mono, monospace; }
 pre { background-color:white; }
 .fname { text-align: right; padding-right: 20pt; }
 .stata { text-align: left; }
 .cmd { font-family:Oxygen Mono, monospace; }
 .stcmd { font-family:Oxygen Mono, monospace; font-size:x-small; color:gray; }
</style>
</head>
<body>

<h1>Data Sets</h1>

<p>대부분의 자료 파일은 <a href="http://www.stata.com/support/faqs/data-management/save-for-previous-version/" target="_blank" class="ext">saveold 명령을 이용하여 Version 12 Stata dta 포맷으로 변환</a>하였음.<br />
<a href="https://www.r-project.org/" target="_blank" class="ext">R</a>을 사용하여 변환하는 것도 가능함. 이를 위해서는 R에서
<span class="cmd">install.packages(&quot;readstata13&quot;)</span>으로 <a href="https://cran.r-project.org/web/packages/readstata13/index.html" target="_blank" class="ext"><span class="cmd">readstata13</span></a> 패키지를 설치한 후,
<pre>
library(readstata13)
library(foreign)
write.dta(read.dta13(&quot;filename.dta&quot;), &quot;newfilename.dta&quot;)
</pre>
</p>

<div id="list">
<table border="0">
<tr>
  <th class="fname">File name</th>
  <th class="stata" colspan="2">Stata command</th>
</tr>
<?php

$files = scandir('.');

foreach ($files as $f) {
  if (substr($f, 0, 1) != "." && $f != "index.php") {
    echo "<tr>\n<td class=\"fname\">";
    echo '<a href="', $f, '" id="a_', $f, '">', $f, '</a><br />', "</td>\n";
    echo "<td class=\"stata\">";
    echo '<button onclick="copyText(\'', $f, '\')">Copy</button>', '<input type="text" size="60" value="', $f, '" style="display:none" id="', $f, '" /></td>', "\n";
    echo '<td><span class="stcmd">use "http://econ.korea.ac.kr/~chirokhan/panelbook/data/', $f, '", clear</span>';
    echo "</td>\n</tr>";
  }
}

?>
</table>
</div>

<div style="margin-top:20px; font-size: small; font-family: Helvetica, Arial, sans-serif;">
[
<a href="..">Up</a><!-- |
<a href="../errata1.html">Errata</a> -->
]
</div>
<script>
 function copyText(x) {
   var dta = document.getElementById('a_' + x);
   var obj = document.getElementById(x);
   obj.value = 'use "http://econ.korea.ac.kr/~chirokhan/panelbook/data/' + dta.text + '", clear';
   //alert(obj.value);
   obj.style.display = "inline";
   obj.select();
   obj.setSelectionRange(0,99999);
   document.execCommand("copy");
   obj.style.display = "none";
   alert("Copied to clipboard:\n" + obj.value + "\nYou can paste it into Stata.");
 }
</script>
</body>
</html>
