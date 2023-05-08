function love.load()
    
    middle = require 'librarys/middleclass'
    
    Player = middleclass.class('Player')
    function PlayerNovo(x,y)
      Player.spr = love.graphics.newImage("zapper1.png")
      Player.x = x
      Player.y = y
      Player.vivo = "vivo"
      Player.HP = 125
      Player.speed = 150
  end

    
    Camera = require 'librarys/vrld-hump-08937cc/camera'
    
    cam = Camera()
    
    inimigo = {}
    
    
    inimigo.geraX =  300
    inimigo.geraY =  400
    inimigo.x     =  100
    inimigo.y     =  100
    inimigo.tmX   =  16
    inimigo.tmY   =  16
    inimigo.speed =  100
    inimigo.direc =  0
    inimigo.HP    =  50
    inimigo.vivo  =  "vivo"
    inimigo.ATK   =  25
    
    inimigo.spr   =  love.graphics.newImage("inimigo1.png")
    
	
	
	
    font1 = love.graphics.newFont(25,'mono')
    
    font1:setFilter("nearest")
    
    love.graphics.setFont(font1)
    
    fps = 10
    
    bloco = {}
    
    

    bloco.x = 400
    bloco.y = 300
    
    
    bloco.spr   =  love.graphics.newImage("gg01.png")
    
    
    
	altura_tela  = 600
	largura_tela = 800
	
 
	math.randomseed(os.time())
    direction = ""
    
    
    
	
end

function moveInimigo(Dt)
    
    if Player.y - inimigo.y > 0 then
        inimigo.y = inimigo.y + inimigo.speed * Dt
        
        
    elseif Player.y - inimigo.y < 0 then
        inimigo.y = inimigo.y - inimigo.speed * Dt
        
    end
    
    if Player.x - inimigo.x > 0 then
        inimigo.x = inimigo.x + inimigo.speed * Dt
        
    elseif Player.x - inimigo.x < 0 then
    elseif Player.x - inimigo.x < 0 then
        inimigo.x = inimigo.x - inimigo.speed * Dt
    end
    
    
end

function love.update(Dt)
    moveInimigo(Dt)
    
    
    cam:lookAt(Player.x,Player.y)
	
end


function love.draw()
    cam:attach()
        
        love.graphics.draw(bloco.spr,bloco.x,bloco.y,0,50,50,8,8)
        
        love.graphics.draw(inimigo.spr,inimigo.x,inimigo.y,0,6,6,8,8)
    
        love.graphics.draw(Player.spr,Player.x,Player.y,0,5,5,8,8)
    cam:detach()
    for i,botao in ipairs(botoes) do
        
      love.graphics.rectangle(
          "fill",
          200,
          400,
          largura,
          altura 
          )
    end
    


end
  
function NovoBotao(texto,x,y,altura,largura,fn)
    -- botao
    
    return{
        texto = texto,
        x = x,
        y = y,
        altura = altura,
        largura = largura,
        fn = fn
        
    }
end

local botoes = {}


function love.load()
    table.insert(botoes,NovoBotao(
        "down",
        250,
        400,
        50,
        50,
        function()
            
            
        end ))
    
    table.insert(botoes,NovoBotao(
        "Up",
        250,
        500,
        50,
        50,
        function()
            Player.y = Player.y - Player.speed
            
        end ))
    
end

 