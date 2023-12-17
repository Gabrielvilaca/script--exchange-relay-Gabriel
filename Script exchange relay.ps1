# Caminho para o arquivo de texto com os endereços IPs
$caminhoArquivo = "C:\Caminho\do\Arquivo\doc1.txt"

# Obtendo o conector de recebimento 
$ReceiveConnector = Get-ReceiveConnector -Identity "relay"

# Lendo o arquivo de texto e adicionando os endereços IP ao relay
$enderecosIP = Get-Content -Path $caminhoArquivo

foreach ($IP in $enderecosIP) {
    Add-ReceiveConnectorPermission -Identity $ReceiveConnector.Identity -RemoteIPRanges $IP -AccessRights "ms-Exch-SMTP-Accept-Any-Recipient" -ErrorAction SilentlyContinue

    #start-sleep adicionado para não travar no momento da inclusão do comando
    Start-Sleep -Seconds 5
}
