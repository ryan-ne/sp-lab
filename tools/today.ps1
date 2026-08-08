<#
.SYNOPSIS
    Start-of-session dashboard for the 140-day plan.

.DESCRIPTION
    Prints where you are, whether the calendar still allows the finish date,
    which checkpoint cards are due, and whether the README progress counter
    has drifted from the real checkbox count.

    Read-only. Never edits the repo.

.EXAMPLE
    .\tools\today.ps1
    .\tools\today.ps1 -AsOf 2026-09-15
#>

[CmdletBinding()]
param(
    # Pretend today is this date. Useful for checking a future week's load.
    [datetime] $AsOf = (Get-Date).Date,

    # Target finish date.
    [datetime] $Deadline = [datetime]'2026-12-31',

    # The one day a week that is not a study session.
    [ValidateSet('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')]
    [string] $RestDay = 'Sunday'
)

$ErrorActionPreference = 'Stop'

$repo       = Split-Path -Parent $PSScriptRoot
$readmePath = Join-Path $repo 'README.md'
$cpPath     = Join-Path $repo 'docs/checkpoints.md'

function Write-Head($text) {
    Write-Host ''
    Write-Host $text -ForegroundColor Cyan
    Write-Host ('─' * $text.Length) -ForegroundColor DarkGray
}

function Write-Row($label, $value, $colour = 'White') {
    Write-Host ('  {0,-26}' -f $label) -NoNewline -ForegroundColor Gray
    Write-Host $value -ForegroundColor $colour
}

# ── Progress ────────────────────────────────────────────────────────────────
if (-not (Test-Path $readmePath)) { throw "README.md not found at $readmePath" }
$readme = Get-Content $readmePath -Raw

$tickedActual   = ([regex]::Matches($readme, '(?m)^\s*-\s\[x\]\s')).Count
$untickedActual = ([regex]::Matches($readme, '(?m)^\s*-\s\[\s\]\s')).Count
$planTotal      = $tickedActual + $untickedActual
$remaining      = $planTotal - $tickedActual

Write-Head 'Progress'
Write-Row 'Days done'      ("{0} / {1}" -f $tickedActual, $planTotal)
Write-Row 'Days remaining' $remaining

# Current day = the first unticked box in file order.
# A merged day reads "**B14 + B15**", so match the whole bold span.
$firstOpen = [regex]::Match($readme, '(?m)^\s*-\s\[\s\]\s\*\*(?<id>[BD]\d+[^*]*)\*\*\s*—\s*(?<txt>.+)$')
if ($firstOpen.Success) {
    $txt = $firstOpen.Groups['txt'].Value -replace '\s*·.*$', ''
    if ($txt.Length -gt 58) { $txt = $txt.Substring(0, 55) + '...' }
    Write-Row 'Up next' ("{0} — {1}" -f $firstOpen.Groups['id'].Value, $txt) 'Yellow'
}

# ── Counter drift ───────────────────────────────────────────────────────────
$stated = [regex]::Match(
    $readme,
    '\*\*Bridge phase:\*\*\s*(?<b>\d+)\s*/\s*(?<bt>\d+).*?\*\*Core plan:\*\*\s*(?<c>\d+)\s*/\s*(?<ct>\d+).*?\*\*Total:\*\*\s*(?<t>\d+)\s*/\s*(?<tt>\d+)'
)

$drift = $false
if ($stated.Success) {
    $statedTotal = [int]$stated.Groups['t'].Value
    if ($statedTotal -ne $tickedActual) {
        $drift = $true
        Write-Host ''
        Write-Host '  ! README progress counter is stale' -ForegroundColor Red
        Write-Host ("    says {0} / {1}, checkboxes say {2} / {3}" -f `
            $statedTotal, $stated.Groups['tt'].Value, $tickedActual, $planTotal) -ForegroundColor Red
    }
} else {
    Write-Host ''
    Write-Host '  ! Could not find the progress line in README.md' -ForegroundColor Red
    $drift = $true
}

# ── Calendar ────────────────────────────────────────────────────────────────
$calendarDays = 0
$sessions     = 0
for ($d = $AsOf; $d -le $Deadline; $d = $d.AddDays(1)) {
    $calendarDays++
    if ($d.DayOfWeek -ne $RestDay) { $sessions++ }
}

$slack = $sessions - $remaining

Write-Head ("Calendar  ({0:ddd dd MMM yyyy} → {1:dd MMM yyyy})" -f $AsOf, $Deadline)
Write-Row 'Calendar days left' $calendarDays
Write-Row ("Sessions left (6/wk)") $sessions
Write-Row 'Sessions needed'      $remaining

if ($slack -gt 0) {
    Write-Row 'Slack' ("+{0} spare sessions" -f $slack) 'Green'
} elseif ($slack -eq 0) {
    Write-Row 'Slack' 'zero — every session must land' 'Yellow'
} else {
    Write-Row 'Slack' ("{0} — deadline unreachable at 6/wk" -f $slack) 'Red'
    $needPerWeek = [math]::Ceiling($remaining / ($calendarDays / 7))
    Write-Host ("    Need {0} sessions/week, or merge {1} more reading days." -f `
        $needPerWeek, [math]::Abs($slack)) -ForegroundColor Red
}

if ($AsOf.DayOfWeek -eq $RestDay) {
    Write-Host ''
    Write-Host ("  {0} is your catch-up day. Only work it if you are behind." -f $RestDay) -ForegroundColor DarkGray
}

# ── Checkpoints due ─────────────────────────────────────────────────────────
Write-Head 'Checkpoint cards due'

if (-not (Test-Path $cpPath)) {
    Write-Host '  docs/checkpoints.md not found.' -ForegroundColor Red
    return
}

# Question text, from the bank tables.
$questions = @{}
foreach ($m in [regex]::Matches((Get-Content $cpPath -Raw), '(?m)^\|\s*(CP-\d+)\s*\|\s*([^|]+?)\s*\|')) {
    if (-not $questions.ContainsKey($m.Groups[1].Value)) {
        $questions[$m.Groups[1].Value] = $m.Groups[2].Value.Trim()
    }
}

# Answer log: five columns, last row per ID wins.
$latest = @{}
foreach ($m in [regex]::Matches(
        (Get-Content $cpPath -Raw),
        '(?m)^\|\s*(CP-\d+)\s*\|\s*(\d{4}-\d{2}-\d{2})\s*\|\s*([yn])\s*\|\s*([^|]*?)\s*\|\s*(\d{4}-\d{2}-\d{2})\s*\|')) {
    $latest[$m.Groups[1].Value] = [pscustomobject]@{
        Id      = $m.Groups[1].Value
        Asked   = [datetime]$m.Groups[2].Value
        Recall  = $m.Groups[3].Value
        Gap     = $m.Groups[4].Value
        NextDue = [datetime]$m.Groups[5].Value
    }
}

$due = $latest.Values | Where-Object { $_.NextDue -le $AsOf } | Sort-Object NextDue

if (-not $due) {
    Write-Host '  Nothing due. Seed a card from the bank if the log is thin.' -ForegroundColor DarkGray
} else {
    foreach ($card in $due) {
        $overdue = ($AsOf - $card.NextDue).Days
        $tag = if ($overdue -gt 0) { " ({0}d overdue)" -f $overdue } else { ' (due today)' }
        $colour = if ($overdue -gt 7) { 'Red' } elseif ($overdue -gt 0) { 'Yellow' } else { 'White' }

        Write-Host ("  {0}{1}" -f $card.Id, $tag) -ForegroundColor $colour
        if ($questions.ContainsKey($card.Id)) {
            Write-Host ("    {0}" -f $questions[$card.Id]) -ForegroundColor Gray
        }
        if ($card.Recall -eq 'n' -and $card.Gap) {
            Write-Host ("    last gap: {0}" -f $card.Gap) -ForegroundColor DarkGray
        }
    }
    Write-Host ''
    Write-Host '  Out loud. No notes. Then log the row.' -ForegroundColor DarkGray
}

Write-Host ''
if ($drift) { exit 1 }
