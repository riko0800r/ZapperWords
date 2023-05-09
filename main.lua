middle = require 'librarys/middleclass'

botao = middle.class('Botao')

local Botoes = {}

font1 = love.graphics.newFont(25,'mono')

font1:setFilter("nearest")

love.graphics.setFont(font1)

function botao:initialize(texto,x,y,largura,altura,font,cor1,fn)
    -- botao
  self.texto = texto
  self.x = x
  self.y = y
  self.largura = largura
  self.altura = altura
  self.font = font
  self.cor1 = cor1
  self.ID = #Botoes + 1
  self.fn = fn
  table.insert(Botoes, self)
  return self
end
function botao:Draw()
  love.graphics.setColor(1,1,1,1)
  love.graphics.rectangle("fill",self.x,self.y,self.altura,self.largura)
  love.graphics.setColor(self.cor1)
  love.graphics.print(self.texto, self.x, self.y)
end

function DrawBotoes()
	for i,botao in pairs(Botoes) do
		botao:Draw()
	end 
end
function love.load()
  botao:new("Up",120,250,50,50,font1,{3,5,1,1},function() end)
  botao:new("down",120,350,50,50,font1,{3,5,1,1},function() end )
    Camera = require 'librarys/vrld-hump-08937cc/camera'
    
  Player = middle.class('Player')
  
  function Player:Novo(x,y)
    self.spr = love.graphics.newImage("zapper1.png")
    self.x = x
    self.y = y
    self.vivo = "vivo"
    self.HP = 125
    self.speed = 150
  end
  
  p1 = Player:Novo(300,240)
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
    inimigo.y= inimigo.y + inimigo.speed * Dt
  elseif Player.y - inimigo.y < 0 then
    inimigo.y = inimigo.y - inimigo.speed * Dt
  elseif Player.x - inimigo.x > 0 then
    inimigo.x = inimigo.x + inimigo.speed * Dt
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
    DrawBotoes()
end
