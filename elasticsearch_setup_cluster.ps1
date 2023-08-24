 
 $elasticsearch = "https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-windows-x86_64.zip"
 $kibana = "https://artifacts.elastic.co/downloads/kibana/kibana-8.4.3-windows-x86_64.zip"
 $elasticpackage = "elasticsearch-8.4.3"
 $kibanapackage = "kibana-8.4.3"
 $DownloadZipelastic = "c:\temp\" + $(Split-Path -Path $elasticsearch -Leaf)
 $DownloadZipkibana = "c:\temp\" + $(Split-Path -Path $kibana -Leaf)
 $ExtractPathelastic = "c:\temp\elastic\"
 $ExtractPathkibana = "c:\temp\kibana\"
 $node = "node1"
  

 ### Install Elasticsearch ###


 New-Item -Path $ExtractPathelastic -ItemType Directory

 New-Item -Path 'C:\elk\elasticsearch' -ItemType Directory
 New-Item -Path 'C:\elk\elasticsearch\node1\data\' -ItemType Directory
 New-Item -Path 'C:\elk\elasticsearch\node1\log\' -ItemType Directory

 Invoke-WebRequest -Uri $elasticsearch -OutFile $DownloadZipelastic

 $ExtractShell = New-Object -ComObject Shell.Application
 
 $ExtractFiles = $ExtractShell.Namespace($DownloadZipelastic).Items()

 $ExtractShell.NameSpace($ExtractPathelastic).CopyHere($ExtractFiles)

 copy $ExtractPathelastic\*\* 'C:\elk\elasticsearch\' -Recurse

 copy-Item -Path 'C:\es_config\Server\elasticsearch\windows\elasticsearch.yml' -Destination 'C:\elk\elasticsearch\config\' -Recurse

 copy-Item -Path 'C:\es_config\Server\elasticsearch\windows\node1*' -Destination 'C:\elk\elasticsearch\config\' -Recurse

 copy-Item -Path 'C:\es_config\Server\elasticsearch\windows\ca.crt' -Destination 'C:\elk\elasticsearch\config\' -Recurse

 cd 'C:\es_config\Server'

 .\elastic_start.vbs




  