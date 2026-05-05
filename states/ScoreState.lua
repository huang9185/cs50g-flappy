--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

local BRONZE = love.graphics.newImage('bronze_medal.png')
local SILVER = love.graphics.newImage('silver_medal.png')
local GOLD = love.graphics.newImage('gold_medal.png')

BRONZE_SCORE = 5
SILVER_SCORE = 7
GOLD_SCORE = 9

function ScoreState:enter(params)
    self.score = params.score

    if self.score >= GOLD_SCORE then
        self.medal_image = GOLD
    elseif self.score >= SILVER_SCORE then
        self.medal_image = SILVER
    elseif self.score >= BRONZE_SCORE then
        self.medal_image = BRONZE
    end
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, VIRTUAL_HEIGHT / 8 -10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)

    love.graphics.printf('Score: ' .. tostring(self.score), -20, 75, VIRTUAL_WIDTH, 'center')

    if self.score >= BRONZE_SCORE then
        love.graphics.draw(self.medal_image, VIRTUAL_WIDTH / 2, 35)
    end

    love.graphics.draw(BRONZE, VIRTUAL_WIDTH / 3, 70)
    love.graphics.printf(': ' .. tostring(BRONZE_SCORE), VIRTUAL_WIDTH / 2, 118, VIRTUAL_WIDTH, 'left')

    love.graphics.draw(SILVER, VIRTUAL_WIDTH / 3, 120)
    love.graphics.printf(': ' .. tostring(SILVER_SCORE), VIRTUAL_WIDTH / 2, 168, VIRTUAL_WIDTH, 'left')

    love.graphics.draw(GOLD, VIRTUAL_WIDTH / 3, 170)
    love.graphics.printf(': ' .. tostring(GOLD_SCORE), VIRTUAL_WIDTH / 2, 218, VIRTUAL_WIDTH, 'left')

    love.graphics.printf('Press Enter to Play Again!', 0, VIRTUAL_HEIGHT-30, VIRTUAL_WIDTH, 'center')
end