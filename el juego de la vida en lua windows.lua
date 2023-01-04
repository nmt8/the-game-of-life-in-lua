--  _   _ 
-- | |_| |_  ___   __ _ __ _ _ __  ___ 
-- |  _| ' \/ -_) / _` / _` | '  \/ -_)
--  \__|_||_\___| \__, \__,_|_|_|_\___|
--                |___/                
--      __   _ _  __     
-- ___ / _| | (_)/ _|___
--/ _ \  _| | | |  _/ -_)
--\___/_|   |_|_|_| \___|

-- _        _           
--(_)_ _   | |_  _ __ _ 
--| | ' \  | | || / _` |
--|_|_||_| |_|\_,_\__,_|

-- by nmt8studios 
-- 04/01/2023
-- https://nmt8.itch.io/
-- https://github.com/nmt8?tab=repositories

math.randomseed(os.time())

-- normas -- 
-- Si una célula está viva y tiene dos o tres vecinas vivas, sobrevive.
-- Si una célula está muerta y tiene tres vecinas vivas, nace.
-- Si una célula está viva y tiene más de tres vecinas vivas, muere.

-- funcions -- 
function logic ( X , Y )   
  a1 = "0"
  a2 = "0"
  a3 = "0"
  b1 = "0"
  b2 = "0"
  b3 = "0"
  c1 = "0"
  c2 = "0"
  c3 = "0"
  totalv = a1 + a2 + a3 + b1  + b3 + c1 + c2 + c3 
  if matrix[X][Y] == "■" then 
    --print("b2")
    b2 = "1"
    
  end
  if matrix[X+1][Y] == "■" then 
    --print("c2")
    c2 = "1"
    
  end
  if matrix[X-1][Y] == "■" then 
    --print("a2")
    a2 = "1"
    
  end
  if matrix[X+1][Y+1] == "■" then 
    --print("c3")
    c3 = "1"
    
  end
  if matrix[X-1][Y-1] == "■" then 
    --print("a1")
    a1 = "1"
   
  end
  if matrix[X+1][Y-1] == "■" then 
    --print("c1")
    c1 = "1"
    
  end
  if matrix[X-1][Y+1] == "■" then 
    --print("a3")
    a3 = "1"
    
  end
  if matrix[X][Y+1] == "■" then 
    --print("b3")
    b3 = "1"
    
  end
  if matrix[X][Y-1] == "■" then 
    --print("b1")
    b1 = "1"
    
  end

  -- normas -- 
  totalv = a1 + a2 + a3 + b1  + b3 + c1 + c2 + c3 
  if matrix[X][Y] == "■" then  -- si esta viva 
    
    if (totalv >= 2 ) then -- tiene mas de 2 vecinas vivas 
    end
    if(totalv > 3) then -- si tiene mas de 3 vecinas vivas 
          --print("muere "..X + 1 , Y + 1) --muere
          matrix2[X][Y] = "□"
      else 
        --print("sovrevibe "..X  + 1, Y + 1)  --sovrevibie 
          matrix2[X][Y] = "■"
      end
    
    if( totalv < 2) then -- si tiene menos vecinas vivas  de 2 muere
     -- print("muere "..X + 1 , Y + 1)
      matrix2[X][Y] = "□"
    end
    --print(a1..a2..a3.."\n"..b1..b2..b3.."\n"..c1..c2..c3)
  else if (matrix[X][Y] == "□") then -- si esta muerta 
      
    if(totalv >= 3 ) then -- si tiene mas de 3 vecinas vivas vive  
        --print("nace "..X + 1, Y + 1)
        matrix2[X][Y] = "■"
      end
  end
  end
--print(a1..a2..a3.."\n"..b1..b2..b3.."\n"..c1..c2..c3)
--  print("total vecinas "..totalv)
--print(".........")
end


-- variables -- 
matrix = {}
matrix2 = {}
exit = false
gen = 0

-- pregunta matriz -- 
print("como de grande tiene que ser la matriz? ")
size = io.read("*n")


-- generar tablero vacio -- 
for iY = 1 , size + 2 do
	matrix[iY] = {}
	for iX = 1 , size + 2 do
		matrix[iY][iX] = "□" -- ■ / □
	end
end
--generar tablero 2  vacio --
for iY = 1 , size + 2 do
	matrix2[iY] = {}
	for iX = 1 , size + 2 do
		matrix2[iY][iX] = "□" -- ■ / □
	end
end

-- print inicial -- 
exX = 5 + 1
exY = 5 + 1
matrix[exX][exY] = "□"
matrix[4 + 1][5+ 1] = "■"
matrix[6+ 1][5+ 1] = "■"
matrix[5+ 1][6+ 1] = "■"
matrix[6+ 1][6+ 1] = "■"
matrix[6+ 1][4+ 1] = "■"



while (exit == false) do
  -- pregunta generacion --
  print("generacion = ".. gen)
	print("nueva generación?")
	print("n = si e = no i = infinito")
	respuestagen = io.read()
	if(respuestagen == "n") then
    
    -- Generar generacion -- 
		os.execute("cls")
          --aleatorio --
    --[[cordX = math.random(2, size -1  )
    cordY = math.random(2, size -1 )
    matrix[cordX][cordY] = "■" ]]

    
		for x , v  in pairs(matrix) do
			for x2 , v2 in pairs(matrix) do
				io.write(matrix[x][x2] .. " ")
        
			end
			io.write("\n")
		end
    -- analiz -- 
    for p = 2 , 10 do 
      for i = 2 , 10 do
        logic(p , i)
      end
    end
    
    --tablero 2 --
     for p = 2 , 10 do 
      for i = 2 , 10 do
        matrix[p][i] = matrix2[p][i]
      end
    end
    --vaciar tablero 2 
     for p = 2 , 10 do 
      for i = 2 , 10 do
        matrix2[p][i] = "□"
      end
    end
    
    -- print info -- 
    gen = gen + 1 
    
    --print(cordX , cordY)

	else if(respuestagen == "e") then
		exit = true
    else if (respuestagen == "i") then 

      while ( exit == false ) do 
        -- Generar generacion -- 
          os.execute(package.config:sub(1,1) == "/" and "sleep 1" )
		os.execute("cls")
    
		for x , v  in pairs(matrix) do
			for x2 , v2 in pairs(matrix) do
				io.write(matrix[x][x2] .. " ")
        
			end
			io.write("\n")
		end
    -- analiz -- 
    for p = 2 , 10 do 
      for i = 2 , 10 do
        logic(p , i)
      end
    end
    
    --tablero 2 --
     for p = 2 , 10 do 
      for i = 2 , 10 do
        matrix[p][i] = matrix2[p][i]
      end
    end
    --vaciar tablero 2 
     for p = 2 , 10 do 
      for i = 2 , 10 do
        matrix2[p][i] = "□"
      end
    end
    
    -- print info -- 
    gen = gen + 1 
    
      end
	end
	end
  end

end

-- all rights reserved to @nmt8studios -- 