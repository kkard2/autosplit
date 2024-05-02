state("LiveSplit") {}

init
{
    // I HATE LOCALiZATION I HATE LOCALIZATION I HATE LOCALIZATION
    var fp = System.Globalization.CultureInfo.InvariantCulture;
    vars.currentSplit = 0;
    vars.splits = new TimeSpan[]
    {
        TimeSpan.Parse("00:00:03.690", fp),
        TimeSpan.Parse("00:00:05.420", fp),
        TimeSpan.Parse("00:00:07.210", fp),
    };
}

split
{
    if (vars.currentSplit >= vars.splits.Length)
    {
        return false;
    }

    if (timer.CurrentTime.RealTime.Value > vars.splits[vars.currentSplit])
    {
        vars.currentSplit++;
        return true;
    }

    return false;
}
