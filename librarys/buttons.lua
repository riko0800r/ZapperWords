-- button library
middle = require 'librarys/middleclass'


button2 = {		-- default settings
    text    = "Down",
	colori	= { 255,  20, 147, 255 },
	colora	= { 100, 255,  45, 255 },
	colortext	= { 86, 223, 156},
	mode    = 'fill',
	object	= 'rect',
	x		= 225,
	y		= 335,
	w       = 80,
	h       = 60,
	r		= 15,
	active	= false }

button = {		-- default settings
    text    = "Uppppp",
	colori	= { 255,  20, 147, 255 },
	colora	= { 100, 255,  45, 255 },
	colort  = { 5, 9, 25, 255 },
	mode	= 'fill',
	object	= 'rect',
	x		= 225,
	y		= 200,
	w       = 80,
	h       = 60,
	r		= 15,
	active	= false }

button.__index = button
button.__index = button2

function button.init( t )
	setmetatable( t, button )
	return t
end

function button:draw()
	local clr
	if self.active then clr = self.colora else clr = self.colori end
	love.graphics.setColor( clr )
	if self.object=='circle' then love.graphics.circ( self.mode, self.x, self.y, self.r ) end
	if self.object=='rect' then love.graphics.rectangle( self.mode, self.x-self.w/2, self.y-self.h/2, self.w, self.h ) end
	if self.object=='image' then
		local w, h = 16,16
		love.graphics.draw( self.image, self.x, self.y, 0, self.w/w, self.h/h, w/2, h/2 )
		end
	if self.text then
		love.graphics.setColor(self.colort)
		love.graphics.print( self.text, self.x, self.y)
		
	end
end

function button:update()
	local test
	local mx, my = mouse.getPosition( )
	if self.object == 'circle' then
		test =	mx < self.x + self.r and mx > self.x - self.r and
				my < self.y + self.r and my > self.y - self.r
		end
	if self.object == 'rect' then
		test =	mx < self.x + self.w/2 and mx > self.x - self.w/2 and
				my < self.y + self.h/2 and my > self.y - self.h/2
			end
	if self.object == 'image' then
		local w, h = 16,16
		test =	mx < self.x + w/2 and mx > self.x - w/2 and
				my < self.y + h/2 and my > self.y - h/2
		end
	self.active = test
end

function button2.init( t )

	setmetatable( t, button2 )

	return t
end


function button2:draw()
	local clr
	if self.active then clr = self.colora else clr = self.colori end
	gr.setColor( clr )
	if self.object=='circle' then gr.circ( self.mode, self.x, self.y, self.r ) end
	if self.object=='rect' then gr.rectangle( self.mode, self.x-self.w/2, self.y-self.h/2, self.w, self.h ) end
	if self.object=='image' then
		local w, h = 16,16
		gr.draw( self.image, self.x, self.y, 0, self.w/w, self.h/h, w/2, h/2 )
	end
	
		love.graphics.setColor(self.colortext)
		love.graphics.print( self.text, self.x, self.y)
end

function button2:update()
	local test
	local mx, my = mouse.getPosition( )
	if self.object == 'circle' then
		test =	mx < self.x + self.r and mx > self.x - self.r and
				my < self.y + self.r and my > self.y - self.r
		end
	if self.object == 'rect' then
		test =	mx < self.x + self.w/2 and mx > self.x - self.w/2 and
				my < self.y + self.h/2 and my > self.y - self.h/2
			end
	if self.object == 'image' then
		local w, h = 16,16
		test =	mx < self.x + w/2 and mx > self.x - w/2 and
				my < self.y + h/2 and my > self.y - h/2
		end
	self.active = test
end


return button
