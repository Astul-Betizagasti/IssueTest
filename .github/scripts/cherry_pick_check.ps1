param([string]$commitMessage)

$commitData = $commitMessage | Select-String -Pattern 'Cherry-pick to:\s?"*"'

if($commitData){
    $splitedData = $commitData.Line.split('"')
    $branchName = $splitedData[1]
    if($branchName){
        Write-Output $branchName
        exit
    }
}
Write-Output 'invalid'