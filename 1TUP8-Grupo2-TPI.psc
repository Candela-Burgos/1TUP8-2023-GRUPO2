Algoritmo elTornilloLoco2
	definir articulo, n, i, opciones Como Entero
	
	Escribir "Ingrese la cantidad de articulos que posee la ferreteria"
    Repetir
        leer n
    Hasta Que n > 0
	Limpiar Pantalla
	Dimension articulo[n,9]
	
	definir articuloEncontrado como entero
	Dimension articuloEncontrado[n,5]
	
	definir descripcion Como Caracter
	Dimension descripcion[n]
	
	Definir rubro Como Entero
	definir bandera como logico
	
	Dimension rubro[5]
	rubro[0] = 100
	rubro[1] = 300
	rubro[2] = 450
	rubro[3] = 680
	rubro[4] = 720
	
	Para i = 0 Hasta n-1 Con Paso 1 Hacer
		Repetir
			Escribir "Ingrese el codigo"
			Escribir "100 para el rubro: Tornillos y Tuercas"
			Escribir "300 para el rubro: Adhesivos"
			Escribir "450 para el rubro: Herrajes"
			Escribir "680 para el rubro: Pinturas"
			Escribir "720 para el rubro: Electricidad"
			leer articulo[i,0]
			bandera = validarRubro(n, i, articulo, rubro)
		Hasta Que bandera == Verdadero
		
		Escribir "Ingrese el codigo del producto ", i+1
		Repetir
			leer articulo[i,1]
		Hasta Que Longitud(ConvertirATexto(articulo[i,1])) == 5
		
		Escribir "Ingrese la descripcion del producto ", i+1
		leer descripcion[i]
		
		Escribir "Ingrese el precio de venta del producto ", i+1
		leer articulo[i,2]
		
		Escribir "Ingrese el stock del producto ", i+1
		leer articulo[i,3]
		
		Repetir
			Escribir "Ingrese la cantidad vendida del producto ", i+1, " en la primera quincena"
			leer articulo[i,4]
		Hasta Que articulo[i,4] > 0 y articulo[i,4] <= articulo[i,3]
		
		Repetir
			Escribir "Ingrese la cantidad vendida del producto ", i+1, " en la segunda quincena"
			leer articulo[i,5]
		Hasta Que articulo[i,5] > 0 y articulo[i,5] <= (articulo[i,3] - articulo[i,4])
		
		articulo[i,6] = articulo[i,4] + articulo[i,5]
		articulo[i,7] = articulo[i,6] * articulo[i,2]
		articulo[i,8] = articulo[i,3] - articulo[i,6]
	FinPara
	
	Repetir
        Escribir "1. Mostrar lista de artículos ordenada por descripcion"
        Escribir "2. Mostrar lista de artículos ordenada por cantidad vendida"
        Escribir "3. Mostrar stock actual de artículos"
        Escribir "4. Buscar artículo por código"
        Escribir "5. Mostrar estadísticas"
        Escribir "6. Salir"
        leer opciones
		
        Segun opciones
            1: 
                ordenarXDesc(n, i, articulo, descripcion)
            2:
				ordenarXCantVendida(n, i, articulo, descripcion)
            3:
				stockActual(n, i, articulo, descripcion)
            4:
				buscarXRubro(n, i, articulo, descripcion, bandera, rubro, articuloEncontrado)
            5:
				estadisticas(n, i, articulo, rubro)
            6: 
				Escribir ""
                Escribir "Salio del programa"
				Escribir ""
        FinSegun
    Hasta Que opciones = 6
	
FinAlgoritmo

Funcion bandera = validarRubro(n, i, articulo, rubro)
	si articulo[i,0] == rubro[0] o articulo[i,0] == rubro[1] o articulo[i,0] == rubro[2] o articulo[i,0] == rubro[3] o articulo[i,0] == rubro[4] Entonces
		bandera = Verdadero
	SiNo
		bandera = Falso
	FinSi
	si bandera = Falso Entonces
		escribir "El codigo ingresado no es valido, vuelva a ingresar"
	FinSi
FinFuncion

SubProceso ordenarXRubro(n, i, descripcion, articulo)
	definir j, aux, posMenor Como Entero
	definir auxCarac como caracter
	
	Para i = 0 Hasta n-2 Con Paso 1 Hacer
		posMenor = i
		para j = i+1 Hasta n-1 Con Paso 1 Hacer
			si articulo[j,0] <= articulo[posMenor,0] Entonces
				posMenor = j
			FinSi
		FinPara
		
		aux <- articulo[i,0]
		articulo[i,0] <- articulo[posMenor,0]
		articulo[posMenor,0] <- aux
		
		aux <- articulo[i,1]
		articulo[i,1] <- articulo[posMenor,1]
		articulo[posMenor,1] <- aux
		
		auxCarac <- descripcion[i]
		descripcion[i] <- descripcion[posMenor]
		descripcion[posMenor] <- auxCarac
		
		aux <- articulo[i,2]
		articulo[i,2] <- articulo[posMenor,2]
		articulo[posMenor,2] <- aux
		
		aux <- articulo[i,3]
		articulo[i,3] <- articulo[posMenor,3]
		articulo[posMenor,3] <- aux
	FinPara
FinSubProceso

SubProceso ordenarXDesc(n, i, articulo, descripcion)
	definir j, aux, posMenor Como Entero
	definir auxCarac Como Caracter
	
	Para i = 0 Hasta n-2 Con Paso 1 Hacer
		posMenor = i
		para j = i+1 Hasta n-1 Con Paso 1 Hacer
			si descripcion[j] <= descripcion[posMenor] Entonces
				posMenor = j
			FinSi
		FinPara
		
		aux <- articulo[i,0]
		articulo[i,0] <- articulo[posMenor,0]
		articulo[posMenor,0] <- aux
		
		aux <- articulo[i,1]
		articulo[i,1] <- articulo[posMenor,1]
		articulo[posMenor,1] <- aux
		
		auxCarac <- descripcion[i]
		descripcion[i] <- descripcion[posMenor]
		descripcion[posMenor] <- auxCarac
		
		aux <- articulo[i,2]
		articulo[i,2] <- articulo[posMenor,2]
		articulo[posMenor,2] <- aux
		
	FinPara
	Escribir "Lista de articulos ordenada por descripcion:"
	Para i = 0 Hasta n-1 Hacer
		Escribir ""
		Escribir "Codigo: ", Concatenar(ConvertirATexto(articulo[i,0]),ConvertirATexto(articulo[i,1]))
        Escribir "Descripcion: ", descripcion[i]
		Escribir "Precio venta: ", articulo[i,2]
		Escribir ""
    FinPara
FinSubProceso

SubProceso ordenarXCantVendida(n, i, articulo, descripcion)
	definir j, aux, posMenor Como Entero
	definir auxCarac como caracter
	
	ordenarXRubro(n, i, descripcion, articulo)
	
	Para i = 0 Hasta n-2 con paso 1 Hacer
		posMenor = i
		Para j = i+1 Hasta n-1 Con Paso 1 Hacer
			si articulo[j,6] > articulo[posMenor,6] Entonces
				posMenor = j
			FinSi
		FinPara
		
		aux = articulo[i,0]
		articulo[i,0] = articulo[posMenor,0]
		articulo[posMenor,0] = aux
		
		aux = articulo[i,1]
		articulo[i,1] = articulo[posMenor,1]
		articulo[posMenor,1] = aux
		
		auxCarac = descripcion[i]
		descripcion[i] = descripcion[posMenor]
		descripcion[posMenor] = auxCarac
		
		aux = articulo[i,3]
		articulo[i,3] = articulo[posMenor,3]
		articulo[posMenor,3] = aux
		
		aux = articulo[i,6]
		articulo[i,6] = articulo[posMenor,6]
		articulo[posMenor,6] = aux
		
		aux = articulo[i,7]
		articulo[i,7] = articulo[posMenor,7]
		articulo[posMenor,7] = aux
		
		aux = articulo[i,2]
		articulo[i,2] = articulo[posMenor,2]
		articulo[posMenor,2] = aux
	FinPara
	
	Escribir "Lista de articulos ordenada por cantidad vendida:"
    Para i = 0 Hasta n-1 Hacer
		Escribir ""
		Escribir "Codigo: ", Concatenar(ConvertirATexto(articulo[i,0]),ConvertirATexto(articulo[i,1]))
        Escribir "Descripcion: ", descripcion[i]
		Escribir "Cantidad total vendida en el mes: ", articulo[i,6]
		Escribir "Importe total venta: $", articulo[i,7]
		Escribir ""
    FinPara
FinSubProceso

SubProceso stockActual(n, i, articulo, descripcion)
	ordenarXRubro(n, i, descripcion, articulo)
	
	para i = 0 Hasta n-1 Con Paso 1 Hacer
		Escribir ""
		Escribir "Codigo: ", Concatenar(ConvertirATexto(articulo[i,0]),ConvertirATexto(articulo[i,1]))
        Escribir "Descripcion: ", descripcion[i]
		Escribir "Stock actual: ", articulo[i,8]
		Escribir ""
	FinPara
FinSubProceso

SubProceso buscarXRubro(n, i, articulo, descripcion, bandera, rubro, articuloEncontrado)
	definir j, aux, temp Como Entero
	aux = 0
	i = 0
	Repetir
		Escribir "Ingrese el codigo"
		Escribir "100 para el rubro: Tornillos y Tuercas"
		Escribir "300 para el rubro: Adhesivos"
		Escribir "450 para el rubro: Herrajes"
		Escribir "680 para el rubro: Pinturas"
		Escribir "720 para el rubro: Electricidad"
		leer articuloEncontrado[i,0]
		bandera = validarRubro(n, i, articuloEncontrado, rubro)
	Hasta Que bandera == Verdadero 
	
	ordenarXRubro(n, i, descripcion, articulo)
	
	Para i = 0 Hasta n-1 Hacer
		si articulo[i,0] == articuloEncontrado[0,0] Entonces	
			aux = 1
			temp = i
			Escribir ""
			Escribir "Codigo: ", Concatenar(ConvertirATexto(articulo[temp,0]),ConvertirATexto(articulo[temp,1]))
			Escribir "Descripcion: ", descripcion[temp]
			Escribir "Primera quincena: ", articulo[temp,4]
			Escribir "Segunda quincena: ", articulo[temp,5]
			Escribir "Stock actual: ", articulo[temp,8]
			Escribir "Importe total venta: $", articulo[temp,7]
			Escribir ""
		FinSi
	FinPara
	si aux <> 1 Entonces
		i = n - 1
		Escribir ""
		Escribir "No existe artículo con ese código." 
		Escribir ""
	FinSi
FinSubProceso

SubProceso estadisticas(n, i, articulo, rubro)
	definir porcentaje Como Real
	definir j, aux, totalVentas, rubroBuscar como entero
	definir rubro100, rubro300, rubro450, rubro680, rubro720 como real
	definir rubroMayor como entero
	Dimension rubroMayor[5,3]
	rubro100 = 0
	rubro300 = 0
	rubro450 = 0
	rubro680 = 0
	rubro720 = 0
	aux = 0
	totalVentas = 0
	
	para i = 0 hasta n-1 con paso 1 Hacer
		totalVentas = totalVentas + articulo[i,6]
	FinPara
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		rubroBuscar = articulo[i,0]
		Segun rubroBuscar
			100: 
				rubro100 = rubro100 + articulo[i,6]
			300:
				rubro300 = rubro300 + articulo[i,6]
			450:
				rubro450 = rubro450 + articulo[i,6]
			680:
				rubro680 = rubro680 + articulo[i,6]
			720:
				rubro720 = rubro720 + articulo[i,6]
		FinSegun
	FinPara
	
	rubro100 = rubro100 / totalVentas * 100 
	rubro300 = rubro300 / totalVentas * 100 
	rubro450 = rubro450 / totalVentas * 100 
	rubro680 = rubro680 / totalVentas * 100 
	rubro720 = rubro720 / totalVentas * 100 
	
	Escribir ""
	Escribir "Porcentaje de cantidad vendida por rubro 100 es: ", redon(rubro100), "%"
	Escribir "Porcentaje de cantidad vendida por rubro 300 es: ", redon(rubro300), "%"
	Escribir "Porcentaje de cantidad vendida por rubro 450 es: ", redon(rubro450), "%"
	Escribir "Porcentaje de cantidad vendida por rubro 680 es: ", redon(rubro680), "%"
	Escribir "Porcentaje de cantidad vendida por rubro 720 es: ", redon(rubro720), "%"
	Escribir ""
	
	rubro100 = 0
	rubro300 = 0
	rubro450 = 0
	rubro680 = 0
	rubro720 = 0
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		rubroBuscar = articulo[i,0]
		Segun rubroBuscar
			100: 
				rubro100 = rubro100 + articulo[i,4]
			300:
				rubro300 = rubro300 + articulo[i,4]
			450:
				rubro450 = rubro450 + articulo[i,4]
			680:
				rubro680 = rubro680 + articulo[i,4]
			720:
				rubro720 = rubro720 + articulo[i,4]
		FinSegun
	FinPara
	
	rubro100 = rubro100 / totalVentas * 100 
	rubro300 = rubro300 / totalVentas * 100 
	rubro450 = rubro450 / totalVentas * 100 
	rubro680 = rubro680 / totalVentas * 100 
	rubro720 = rubro720 / totalVentas * 100 
	
	Escribir "Porcentaje de venta en la primera quincena rubro 100 es: ", redon(rubro100), "%"
	Escribir "Porcentaje de venta en la primera quincena rubro 300 es: ", redon(rubro300), "%"
	Escribir "Porcentaje de venta en la primera quincena rubro 450 es: ", redon(rubro450), "%"
	Escribir "Porcentaje de venta en la primera quincena rubro 680 es: ", redon(rubro680), "%"
	Escribir "Porcentaje de venta en la primera quincena rubro 720 es: ", redon(rubro720), "%"
	Escribir ""
	
	rubro100 = 0
	rubro300 = 0
	rubro450 = 0
	rubro680 = 0
	rubro720 = 0
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		rubroBuscar = articulo[i,0]
		Segun rubroBuscar
			100: 
				rubro100 = rubro100 + articulo[i,5]
			300:
				rubro300 = rubro300 + articulo[i,5]
			450:
				rubro450 = rubro450 + articulo[i,5]
			680:
				rubro680 = rubro680 + articulo[i,5]
			720:
				rubro720 = rubro720 + articulo[i,5]
		FinSegun
	FinPara
	
	rubro100 = rubro100 / totalVentas * 100 
	rubro300 = rubro300 / totalVentas * 100 
	rubro450 = rubro450 / totalVentas * 100 
	rubro680 = rubro680 / totalVentas * 100 
	rubro720 = rubro720 / totalVentas * 100 
	
	Escribir "Porcentaje de venta en la segunda quincena rubro 100 es: ", redon(rubro100), "%"
	Escribir "Porcentaje de venta en la segunda quincena rubro 300 es: ", redon(rubro300), "%"
	Escribir "Porcentaje de venta en la segunda quincena rubro 450 es: ", redon(rubro450), "%"
	Escribir "Porcentaje de venta en la segunda quincena rubro 680 es: ", redon(rubro680), "%"
	Escribir "Porcentaje de venta en la segunda quincena rubro 720 es: ", redon(rubro720), "%"
	Escribir ""
	
	rubro100 = 0
	rubro300 = 0
	rubro450 = 0
	rubro680 = 0
	rubro720 = 0
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		rubroBuscar = articulo[i,0]
		Segun rubroBuscar
			100: 
				rubro100 = rubro100 + articulo[i,4] * articulo[i,2]
				rubroMayor[0,1] = rubro100
			300:
				rubro300 = rubro300 + articulo[i,4] * articulo[i,2]
				rubroMayor[1,1] = rubro300
			450:
				rubro450 = rubro450 + articulo[i,4] * articulo[i,2]
				rubroMayor[2,1] = rubro450
			680:
				rubro680 = rubro680 + articulo[i,4] * articulo[i,2]
				rubroMayor[3,1] = rubro680
			720:
				rubro720 = rubro720 + articulo[i,4] * articulo[i,2]
				rubroMayor[4,1] = rubro720
		FinSegun
	FinPara
	
	definir masVendido, pos1 como entero
	rubroMayor[0,0] = 100
	rubroMayor[1,0] = 300
	rubroMayor[2,0] = 450
	rubroMayor[3,0] = 680
	rubroMayor[4,0] = 720
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		si i == 0 Entonces
			masVendido = rubroMayor[i,1]
			pos1 = i
		SiNo
			si rubroMayor[i,1] > masVendido Entonces
				masVendido = rubroMayor[i,1]
				pos1 = i
			FinSi
		FinSi
	FinPara
	
	Escribir "Rubro mas vendido de la primera quincena es: ", masVendido, " rubro ", rubroMayor[pos1,0]
	Escribir ""
	
	rubro100 = 0
	rubro300 = 0
	rubro450 = 0
	rubro680 = 0
	rubro720 = 0
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		rubroBuscar = articulo[i,0]
		Segun rubroBuscar
			100: 
				rubro100 = rubro100 + articulo[i,5] * articulo[i,2]
				rubroMayor[0,2] = rubro100
			300:
				rubro300 = rubro300 + articulo[i,5] * articulo[i,2]
				rubroMayor[1,2] = rubro300
			450:
				rubro450 = rubro450 + articulo[i,5] * articulo[i,2]
				rubroMayor[2,2] = rubro450
			680:
				rubro680 = rubro680 + articulo[i,5] * articulo[i,2]
				rubroMayor[3,2] = rubro680
			720:
				rubro720 = rubro720 + articulo[i,5] * articulo[i,2]
				rubroMayor[4,2] = rubro720
		FinSegun
	FinPara
	
	para i = 0 Hasta n-1 con paso 1 Hacer
		si i == 0 Entonces
			masVendido = rubroMayor[i,2]
			pos1 = i
		SiNo
			si rubroMayor[i,2] > masVendido Entonces
				masVendido = rubroMayor[i,2]
				pos1 = i
			FinSi
		FinSi
	FinPara
	
	Escribir "Rubro mas vendido de la segunda quincena es: ", masVendido, " rubro ", rubroMayor[pos1,0]
	Escribir ""
	
FinSubProceso
	