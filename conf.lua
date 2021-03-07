config = {
    network = {
        packetMagic = "AERO",
        protocolVersion = "3",
        maxRollback = 10,
        delay = 3,
        maxInputsPerPacket = 50,
        syncSmoothing = 1,
        maxRemotePlayers = 8,
        connectInGame = false,
        spectator = {
            ffSpeed = 25,
            smoothing = 20,
            maxDelay = 60,
            minDelay = 25,
            framesPerAck = 10,
        }
    },
    controls = {
        replayFF = "w",
        replayAdvanceFrame = "d",
        replayPause = "space",
        replaySave = "s",
    },
    replay = {
        version = "2",
        readDroppedFiles = true,
    }
}

function love.conf(t)
    t.version = "11.3"
    t.window.width = 500
    t.window.height = 500
    t.window.resizable = true
    t.window.title = "Mandelbrot-LOVE"
    t.identity = "Mandelbrot-LOVE"
end