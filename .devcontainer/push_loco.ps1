$isodate = Get-Date -Format FileDateUniversal
$targets = "os", "core", "data_science", "project", "latest", $isodate
foreach ($target in $targets) {
    docker push matthewbegun/loco:${target}
}
