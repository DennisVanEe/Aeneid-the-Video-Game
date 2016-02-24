void initialize() 
{
}

void step(uint16 milliseconds)
{
    if (isKeyPressed(Escape))
    {
        consolePrintLine("Esc has been paused\nSuspending all other modules");
        Request @sleepReq = Request("pSleepMod", 0, SLEEP_MODULE);
        Requeset @wakeReq = Request("wSleepMod", "pSleepMod", WAKE_MODULE);
        addRequest("ALL", sleepReq);
        addRequest("PauseMenu.as", wakeReq);
    }
}
        