programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		inteiro faccao,dificuldade, energia=0,turno,chance=0, movimentacao= 0

         faca{
         	  
         
           	escreva("\n\n=============================================")
           	escreva("\n            INICIO DE JOGO                     ")
           	escreva("\n=============================================")
			//escolha de facções 
		
          escreva("\nEscolha sua facção:\n")
		escreva("\n\n1 – Militares - Ao buscar suprimentos, recuperam mais energia, mas começam a missão com menos energia.  ")
		escreva("\n2 - Medicos - Eventos perigosos causam menos dano, mas descansar também recupera menos.")
		escreva("\n3 - Saqueadores - Ao buscar suprimentos, há 40% de chance de ganhar +10 energia extra, mas eventos perigosos causam mais dano.")
		escreva("\nOpção :")
		leia(faccao)
		
         limpa()
	}
enquanto( faccao < 1 ou faccao > 3 )// verificaçao 
      //escolha da dificulade
        faca {
           
        	escreva("\n Escolha a dificulade \n")
        	escreva("1- Sobrevivente - modo fácil \n ° O jogador começa com 90 pontos de energia.")
        	escreva("\n2 - Veterano - modo normal  \n ° O jogador começa com 65 pontos de energia.")
        	escreva("\n3 - Apocalipse - modo difícil \n ° O jogador começa com 40 pontos de energia.")
        	escreva("\nOpção : ")
        	leia(dificuldade)

        }enquanto( dificuldade < 1 ou dificuldade > 3)
        // 10 turnos para repetir

        
//ENERGIA inicial 
        se (dificuldade == 1 ){
        energia = 90
        }
  
senao{
	
	se( dificuldade == 2)
	energia = 65

	se( dificuldade == 3)
	energia = 40 
}
//JORNADA DE 10 TURNOS 
   para(turno = 1 ; turno <= 10;turno++)

         faca{
         	escreva("\n1 - Explorar cidade (-15 energia)")
        		escreva("\n2 - Descansar em um abrigo (-5 energia)")
        		escreva("\n3 - Procurar suprimentos (+ 10 energia )")
        		escreva("\nOpção: ")
        		leia(movimentacao)
        		limpa() 
        		
        		se(movimentacao < 1 ou movimentacao > 3){// VALIDAÇÃO DE NUMEROS 1 A 3 
        			escreva("INFORME UM NUMERO VALIDO ")
        		}
         }enquanto (movimentacao < 1 e movimentacao > 3 )
              // inicio da exemplificação de pontos 
       se (movimentacao == 1 ){
       	escreva("\n A cidade foi explorada ")
       	energia= energia - 15 
       }
       senao{
       	se(movimentacao == 2 ){
       	escreva("O descanso foi bom")
       	}
       	se (faccao == 1 ){
       		energia= energia - 8 
       	}
       	senao{
       		escreva("A procura de suprimentos durou ")
       		se(faccao == 2)
       		energia= energia + 15
       	}
       	 se(faccao == 3 ){
       		energia = energia + 10 
       	 
       	} 
       	se ( chance <= 40 ){
       	chance = Util.sorteia(1, 100)//utulizando biblioteca para ssortear 

       	}
       	 
  
	}
       escreva("\nVocê deu sorte caiu uma caixa e tinha recursos extras ")
       energia= energia + 10 

          //inicio limite de energia 
          se(energia >= 100 ){
          	escreva("\nSua energia esta em : ", energia)

          	//sistema de morte 
          }se(energia <= 0){// SE CHEGAR A MENOS DE 0 O JOGADOR MORRE 
          	escreva("\nVocê morreu :",turno)//INTERROMPE O JOGO 
          	
          		// VAI INTERROMPER 
          	
          }
          escreva("\n voce sobreviveu e estar mais perto da base humana ")// APARARECE CASO JOGADOR SOBREVIVA 
     
       
   

         	
        
		
		
	}

	
}



/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 106; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */