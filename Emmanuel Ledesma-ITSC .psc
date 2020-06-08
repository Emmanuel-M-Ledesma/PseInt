// Alumno Emmanuel Ledesma
//PROGRAMACION 1



Proceso cargadeproducto_final
	
	// Definiendo variables 
	
	
	Definir cantidadProd Como Entero;
	Definir a Como Caracter;
	Definir producto Como Caracter;
	Dimension producto[20];
	Definir cantidad Como Entero;
	Dimension cantidad[20];
	Definir cantidad1 Como Caracter;
	Definir precio Como Real;
	Dimension precio[20];
	Definir precioreal Como Caracter;
	Definir contador Como Entero;
	Definir menu Como Entero;
	Definir m Como Caracter;
	Definir flag1 Como Logico;
	definir OP Como Entero;
	definir CA Como Entero;
	definir Total Como real;
	definir OP1 Como caracter;
	
	//asignando variables
	
	flag1 <- falso;
	menu <- 0;
	contador <- 0;
	cantidadProd <- 0;
	a <- '';	
	OP<-999 ;
	CA<- 0;
	Total<-0;
	
	// Menu
	
	Mientras menu<>5 Hacer
		m <- '';
		Borrar Pantalla;
		Escribir '____________________________________';
		Escribir '| Carga y venta de productos       |';
		Escribir '|----------------------------------|';
		Escribir '|1- Cargar producto y precio       |';
		Escribir '|2- Venta de productos             |';
		Escribir '|3- Stock                          |';
		Escribir '|----------------------------------|';
		Escribir '|5- Salir                          |';
		Escribir '|----------------------------------|';
		Leer m;
		Si m='1' O m='2' O m='3' O m='5' Entonces
			menu <- ConvertirANumero(m);
		SiNo
			Escribir 'Solo se admiten numeros que correspondan al menu';
			Esperar 2 Segundos;
		FinSi
		
		// opciones de menu
		
		Segun menu  Hacer
			1:
				//OPCION DE CARGA DE PRODUCTOS
				
				Repetir
					Borrar Pantalla;
					Escribir 'Cuantos productos desea ingresar?(Maximo 20)';
					Leer a;
					Si a='1' O a='2' O a='3' O a='4' O a='5' O a='6' O a='7' O a='8' O a='9' O a='10' O a='11' O a='12' O a='13' O a='14' O a='15' O a='16' O a='17' O a='18' O a='19' O a='20' Entonces
						cantidadProd <- ConvertirANumero(a);
					SiNo
						Escribir 'Solo se admiten NUMEROS del 1 al 20';
						Esperar Tecla;
						Borrar Pantalla;
					FinSi
				Hasta Que cantidadProd>=1 Y cantidadProd<=20
				Para contador<-0 Hasta cantidadProd-1 Hacer
					Borrar Pantalla;
					Escribir 'Ingrese Producto: ',contador+1;
					Escribir 'Nombre:';
					Leer producto[contador];
					Borrar Pantalla;
					cantidad1 <- '';
					
					// llamando a subproceso de cantidad
					cantnum(cantidad,contador,cantidad1);
					Repetir
						precioreal <- '';
						
						// llamando a subproceso de precio
						PrecioANumeros(precioreal,precio,contador);
						Si precio[contador]<=0 Entonces
							Escribir 'El precio del producto debe ser mayor a $ 0';
							Escribir 'Ingrese nuevamente el precio:';
							Esperar Tecla;
							Borrar Pantalla;
						FinSi
					Hasta Que precio[contador]>0
				FinPara
				Escribir 'Se han agregado correctamente los productos';
				Esperar 1 Segundos;
			2:
				//OPCION DE VENTA
				
				OP<-999 ;
				Si cantidadProd>=1 Entonces
					Mientras OP<>99 Hacer
						Repetir	
							
							Repetir
								contador<-0;
								
								Borrar Pantalla;
								Escribir '__________________________________________';
								Escribir '| Presione las opciones que desea vender |';
								Escribir '__________________________________________';
								Escribir '| Presione 99 para salir                 |';
								Escribir '__________________________________________';
								Escribir '|n°| Producto - Precio - Stock          ';
								Escribir '__________________________________________';
								Para contador<-0 Hasta cantidadProd-1 Hacer
									Si precio[contador]>0 y cantidad[contador]>=1 Entonces
										Escribir '|',contador+1,' | ',producto[contador],' - $',precio[contador],' - ',cantidad[contador],' (kg/Unidades)';
									SiNo
										flag1<-Verdadero;
										
									FinSi
								FinPara	
								Si flag1=Verdadero Entonces
									Escribir '__________________________________________';
									Escribir 'Algunos productos fueron omitidos por falta de stock';
								FinSi
								Escribir '__________________________________________';								
								Escribir 'El total es $',Total;
								Escribir '__________________________________________';
								
								Escribir 'Opcion'; 
								Leer OP1;
								Si OP1='1' o OP1='2' o OP1='3' o OP1='4' o OP1='6' o OP1='5' o OP1='7' o OP1='8' o OP1='9' o OP1='10' o OP1='11' o OP1='12' o OP1='14' o OP1='13' o OP1='15' o OP1='16' o OP1='17' o OP1='18' o OP1='19' o OP1='20' o OP1='99' Entonces
									OP<-ConvertirANumero(OP1);
								SiNo
									Escribir 'Opcion invalida';
									Limpiar Pantalla;
								FinSi
							Hasta Que OP>=1 y OP<=20 o OP=99
							
						
							
							Si (OP)<=(cantidadProd) Entonces
								Si OP<>99 Entonces
									Escribir 'Cantidad';
									leer CA;
									Si CA<=cantidad((OP)-1) Entonces
										Total<-Total+precio((OP)-1)*CA;
										
										cantidad((OP)-1)<-cantidad((OP)-1)-CA;
										
										Esperar Tecla;
									SiNo
										Escribir 'La cantidad pedida supera a la disponible';
										Escribir 'Solo quedan ',cantidad((OP)-1),' Unidades/kgs de ',producto((OP)-1);
										Esperar 2 Segundos;
									FinSi
								SiNo
									Escribir 'saliendo.';
									Esperar 1 Segundos;
									Limpiar Pantalla;
									Escribir 'saliendo..';
									Esperar 1 Segundos;
									Limpiar Pantalla;
									Escribir 'saliendo...';
									Esperar 1 Segundos;
									Limpiar Pantalla;
								FinSi							
							FinSi							
						Hasta Que OP=99
					FinMientras
					
					
				SiNo
					Borrar Pantalla;
					Escribir 'Aun no ha cargado ningun producto';
					Escribir 'Presione para continuar';
					Esperar Tecla;
				FinSi
				
			3:
				//OPCION DE STOCK DISPONIBLE
				
				Si cantidadProd>=1 Entonces
					Borrar Pantalla;
					Escribir '__________________________________________';
					Escribir '|n°| Producto - Precio - Stock          ';
					Escribir '__________________________________________';
					Para contador<-0 Hasta cantidadProd-1 Hacer
						Si precio[contador]>0 y cantidad[contador]>=1 Entonces
							Escribir '|',contador+1,' | ',producto[contador],' - $',precio[contador],' - ',cantidad[contador],' (kg/Unidades)';
							
						FinSi
						Si cantidad[contador]<=0 Entonces
							Escribir '|',contador+1,' | ',producto[contador],' - $',precio[contador],' - SIN STOCK';
							
						FinSi
						
						
					FinPara	
					Esperar Tecla;
					Escribir 'Presione para continuar';
				SiNo
					Escribir 'Aun no posee STOCK';
					Esperar 2 Segundos;
					Limpiar Pantalla;
				FinSi
				
			5:
				//SALIDA DEL PROGRAMA
				
				Limpiar Pantalla;
				Escribir 'Saliendo.';				
				Esperar 1 Segundos;
				Limpiar Pantalla;
				Escribir 'Saliendo..';			
				Esperar 1 Segundos;
				Limpiar Pantalla;
				Escribir 'Saliendo...';				
				Esperar 1 Segundos;
				Limpiar Pantalla;
			De Otro Modo:
				
				//ERROR DE OPCION
				
				Borrar Pantalla;
				Escribir 'opcion invalida vuelva a ingresar una correcta';
		FinSegun
	FinMientras
FinProceso

//Subproceso de Cantidad


SubProceso cantnum(cantidad,contador,cantidad1)
	// Variables a utilizar en el subproceso de cantidad
	Definir i Como Entero;
	Definir cont Como Caracter;
	Definir flag Como Logico;
	flag <- falso;
	cont <- '';
	Repetir
		Escribir 'ingrese la cantidad que posee en stock del producto (kg o unidades)';
		Leer cantidad1;
		Para i<-0 Hasta Longitud(cantidad1)-1 Hacer
			cont <- Subcadena(cantidad1,i,i);
			Si  NO (cont='0' O cont='1' O cont='2' O cont='3' O cont='4' O cont='5' O cont='6' O cont='7' O cont='8' O cont='9') Entonces
				flag <- falso;
				i <- Longitud(cantidad1);
			SiNo
				flag <- verdadero;
			FinSi
		FinPara
		Si  NO (flag=verdadero) Entonces
			Borrar Pantalla;
			Escribir 'Error, la cantidad no debe contener letras o puntos';
			Escribir '';
			Escribir 'Vuelva a intentar';
			Esperar Tecla;
			Borrar Pantalla;
		SiNo
			cantidad[contador] <- ConvertirANumero(cantidad1);
		FinSi
		Si flag=verdadero Y cantidad[contador]>0 Entonces
			Escribir 'Correcto agregado';
			Esperar 1 Segundos;
			Borrar Pantalla;
		FinSi
	Hasta Que flag=verdadero
FinSubProceso


//Subproceso de precio

SubProceso PrecioANumeros(precioreal,precio,contador)

	// Variables a utilizar en el subproceso de precio
	
	
	Definir i Como Entero;
	Definir cont Como Caracter;
	Definir flag Como Logico;
	flag <- falso;
	cont <- '';
	
	
	Repetir
		Escribir 'Precio:';
		Leer precioreal;
		Para i<-0 Hasta Longitud(precioreal)-1 Hacer
			cont <- Subcadena(precioreal,i,i);
			Si  NO (cont='0' O cont='1' O cont='2' O cont='3' O cont='4' O cont='5' O cont='6' O cont='7' O cont='8' O cont='9' O cont='.') Entonces
				flag <- falso;
				i <- Longitud(precioreal);
			SiNo
				flag <- verdadero;
			FinSi
		FinPara
		Si  NO (flag=verdadero) Entonces
			Borrar Pantalla;
			Escribir 'Error el precio no debe contener letras';
			Escribir '';
			Escribir 'Vuelva a intentar';
			Esperar 2 Segundos;
			Borrar Pantalla;
		SiNo
			precio[contador] <- ConvertirANumero(precioreal);
		FinSi
		Si flag=verdadero Y precio[contador]>0 Entonces
			Escribir 'Correcto agregado';
			Esperar 1 Segundos;
			Borrar Pantalla;
		FinSi
	Hasta Que flag=verdadero
FinSubProceso