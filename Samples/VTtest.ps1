if ($host.UI.SupportsVirtualTerminal) {
    $esc = [char]0x1b
    "A yellow ${esc}[93mhello${esc}[0m"
}