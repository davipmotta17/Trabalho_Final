programa
{
	inclua biblioteca Util --> u // Biblioteca usada para gerar números aleatórios
	
	funcao inicio()
	{    // DECLARAÇÃO DE VARIAVEIS 
		inteiro faccao,dificuldade, energia=0,turno,chance=0, movimentacao= 0
		inteiro tipo_Evento=0 , probabilidade, evento
		inteiro explorar=0,descansar=0 , procurar=0, eventosPerigosos=0
		
		//DESAFIO - sistema de kit médico (cura extra)
		inteiro kitMedico = 1 , kit
		 //================== ESCOLHA DA FACÇÃO ===============
		faca{
			escreva("\n\n=============================================")
			escreva("\n            INICIO DE JOGO                     ")
			escreva("\n=============================================")

			escreva("\nEscolha sua facção:\n")
			escreva("\n\n1 – Militares - Ao buscar suprimentos, recuperam mais energia, mas começam a missão com menos energia.  ")
			escreva("\n2 - Medicos - Eventos perigosos causam menos dano, mas descansar também recupera menos.")
			escreva("\n3 - Saqueadores - Ao buscar suprimentos, há 40% de chance de ganhar +10 energia extra, mas eventos perigosos causam mais dano.")
			escreva("\nOpção :")
			leia(faccao)
		
			limpa()
		}
		enquanto( faccao < 1 ou faccao > 3 )//VERIFICADOR 
                // ESCOLHA DA DIFICULDADE 
		faca {
			escreva("\n Escolha a dificulade \n")
			escreva("1- Sobrevivente - modo fácil \n ° O jogador começa com 90 pontos de energia.")
			escreva("\n2 - Veterano - modo normal  \n ° O jogador começa com 65 pontos de energia.")
			escreva("\n3 - Apocalipse - modo difícil \n ° O jogador começa com 40 pontos de energia.")
			escreva("\nOpção : ")
			leia(dificuldade)
		}
		enquanto( dificuldade < 1 ou dificuldade > 3)// VERIFICADOR 

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

		// ================= POSSIBILIDADES DOS EVENTOS ACONTECER =================
		faca{

			probabilidade=Util.sorteia(1, 100)

			se(dificuldade == 1 ){
				tipo_Evento = 10
			}
			senao se (dificuldade == 2){
				tipo_Evento = 20 
			}
			senao se(dificuldade == 3 ){ 
				tipo_Evento = 30
			}

		}
		enquanto(probabilidade < tipo_Evento)

		energia = energia - 20
		eventosPerigosos = eventosPerigosos + 1

		escreva("\nAlgo esta acontecendo, oq é isso")

		evento = Util.sorteia(1,3)

		se(evento == 1){
			escreva("\n esta acontecendo um ataque de zumbis!")
		}
		senao se(evento == 2){
			escreva("\nO predio esta desmoranando, corra!")
		}
		senao se(evento == 3){
			escreva("\nOs zumbis fizeram uma emboscada ")
		}

		// ================= REPETIÇÃO DE 10 VEZES  =================
		para(turno = 1 ; turno <= 10;turno++){

			faca{
				escreva("\n1 - Explorar cidade (-15 energia)")
				escreva("\n2 - Descansar em um abrigo (-5 energia)")
				escreva("\n3 - Procurar suprimentos (+ 10 energia )")
				escreva("\nOpção: ")
				leia(movimentacao)
				limpa() 
				
				se(movimentacao < 1 ou movimentacao > 3){
					escreva("INFORME UM NUMERO VALIDO ")
				}
			}
			enquanto (movimentacao < 1 e movimentacao > 3 )

			// AÇÕES E RESULTADOS DO JOGADOR 
			se (movimentacao == 1 ){
				escreva("\n A cidade foi explorada ")
				energia= energia - 15 
				explorar = explorar + 1
			}
			senao{
				se(movimentacao == 2 ){
					escreva("O descanso foi bom")
					descansar = descansar + 1
				}

				se (faccao == 1 ){
					energia= energia - 8 
				}
				senao{
					escreva("\nA procura de suprimentos durou ")
					se(faccao == 2)
						energia= energia + 15
				}

				se(faccao == 3 ){
					energia = energia + 10 
				}

				procurar = procurar + 1
			}
			chance = Util.sorteia(1,100)
			
                se(chance<=30)//Se o número sorteado for de 1 até 30 → acontece o evento = 30%
			escreva("\nVocê deu sorte caiu uma caixa e tinha recursos extras ")
			energia= energia + 10 

			// ================= DESAFIO: KIT MÉDICO =================
			se(kitMedico > 0){
				escreva("\nDeseja usar kit médico? (1-Sim / 2-Não): ")
				leia(kit)

				se(kit == 1){
					escreva("\nVocê usou um kit médico! +20 energia")
					energia = energia + 20
					kitMedico = kitMedico - 1
				}
			}

			// LIMITE DE VIDA E CONDIÇÕES DE MORTE 
			se(energia >= 100 ){
				energia = 100
			}

			se(energia <= 0){
				escreva("\nVocê morreu :",turno)
				pare
			}

		} // FECHOU O PARA AQUI (CORREÇÃO PRINCIPAL)

		// ================= RELATORIO FINAL (FORA DO LOOP) =================
		escreva("\n\n===============================")
		escreva("\n   RELATORIO FINAL DA MISSÃO     ")
		escreva("\n==================================")
		escreva("\nTurnos resistidos : ", (turno-1))
		escreva("\nEnergia: ", energia)
		escreva("\nVezes que explorou: ", explorar)
		escreva("\nDescansou: ", descansar)
		escreva("\nProcurou suprimentos: ", procurar)
		escreva("\nEventos perigosos: ", eventosPerigosos)

		se(energia > 0){
			escreva("\nStatus: Chegou à base humana")
		}
		senao{
			escreva("\nStatus: Não conseguiu chegar à base")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3478; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */