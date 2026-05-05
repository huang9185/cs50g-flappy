PauseState = Class{__includes = BaseState}

function PauseState:init()
end

function PauseState:update()
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            pause = false,
            bird = self.bird,
            pipePairs = self.pipePairs,
            timer = self.timer,
            score = self.score,
            lastY = self.lastY
        })
    end
end

function PauseState:render()
    love.graphics.draw(PAUSE, VIRTUAL_WIDTH/2-50, VIRTUAL_HEIGHT/2-50)
end

function PauseState:enter(params)
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.score = params.score
    self.lastY = params.lastY

    love.audio.pause()
    sounds['pause']:play()
end

function PauseState:exit()
    sounds['pause']:play()
    sounds['music']:play()
end