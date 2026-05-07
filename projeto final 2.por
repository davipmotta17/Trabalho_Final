programa
{
	inclua biblioteca Util --> u

	funcao inicio()
	{
		// ================= INTRODUÇÃO=================
		escreva("\n===================================================")
		escreva("\n           BEM-VINDO AO APOCALIPSE ZUMBI")
		escreva("\n===================================================")
		escreva("\nO mundo entrou em colapso apos uma pandemia transformar a população em zumbis.")
		escreva("\nVocê precisa atravessar uma cidade devastada ate Aurora, a ultima Base Humana.")
		escreva("\nGerencie sua energia, tome decisões estrategicas e sobreviva aos perigos.\n")

		// ================= VARIVEIS =================
		inteiro faccao, dificuldade        // escolhas do jogador
          inteiro energia = 0                // vida ou energia do jogador
          inteiro turno = 0                     // contador de dias
          inteiro movimentacao = 0           // ação escolhida no dia
          inteiro chance = 0, tipo_Evento = 0, probabilidade, evento  // usados para eventos aleatorios
          inteiro explorar = 0, descansar = 0, procurar = 0, eventosPerigosos = 0  // contadores para o resumo final
          inteiro kitMedico = 0, kit , numKit =0         // controle do uso de kits mﾃｩdicos
          cadeia resumo// texto resumindo a aﾃｧﾃ｣o do dia// cADEIA SERVE PARA GUARDAR UM TEXTO 
           

		// ================= ESCOLHA DA FACﾃ�ﾃグ =================
		faca{
			escreva("\n\n=============================================")
			escreva("\n            ESCOLHA SUA FACÇÃO")
			escreva("\n=============================================")

			escreva("\nCada facção tem vantagens e desvantagens. Escolha sabiamente!\n")

			escreva("\n1 - MILITARES")
			escreva("\n Sofrem menos dano em eventos (-10 ao inves de -20)")
			escreva("\n Descansar recupera menos (-8 energia ao inves de -5)")
			escreva("\n Especialistas em combate e sobrevivencia militar")

			escreva("\n\n2 - MEDICOS")
			escreva("\n Ganham mais energia ao procurar suprimentos (+15 ao inves de +10)")
			escreva("\n Começam com menos energia (-10)")
			escreva("\n Especialistas em primeiros socorros e resistencia")

			escreva("\n\n3 - SAQUEADORES")
			escreva("\n 40% de chance de +10 energia extra ao procurar suprimentos")
			escreva("\n Eventos perigosos causam mais dano (-25 energia)")
			escreva("\n Especialistas em exploração e risco")

			escreva("\n\nOpção: ")
			leia(faccao)
			limpa()
		}
		enquanto(faccao < 1 ou faccao > 3)

		// ================= ESCOLHA DA DIFICULDADE =================
		faca{
			escreva("\n\n=============================================")
			escreva("\n          ESCOLHA A DIFICULDADE")
			escreva("\n=============================================")

			escreva("\nCada dificuldade muda o nivel de sobrevincia:")
			escreva("\nLembrando que é possivel encontrar kits para aumentar a energia , se der sorte !")

			escreva("\n\n1 - SOBREVIVENTE (FACIL)")
			escreva("\n Começa com 90 de energia")
			escreva("\n Eventos perigosos menos frequentes")
			escreva("\n Ideal para iniciantes")

			escreva("\n\n2 - VETERANO (NORMAL)")
			escreva("\n Começa com 65 de energia")
			escreva("\n Desafio equilibrado")
			escreva("\n Para jogadores experientes")

			escreva("\n\n3 - APOCALIPSE (DIFICIL)")
			escreva("\n Começa com 40 de energia")
			escreva("\n Eventos perigosos mais frequentes")
			escreva("\n Sobrevivencia extrema")

			escreva("\n\nOpção: ")
			leia(dificuldade)
			limpa()
		}
		enquanto(dificuldade < 1 ou dificuldade > 3)

		// ================= ENERGIA INICIAL =================
		se(dificuldade == 1){
			energia = 90
		}senao se(dificuldade == 2){
			energia = 65
		}senao{
			energia = 40
		}

		// ================= LOOP DE 10 DIAS =================
		para(turno = 1; turno <= 10; turno++)
	
		{		
			escreva("\n\n==============================")
			escreva("\n DIA ", turno, " DA JORNADA")
			escreva("\n==============================")
			escreva("\nEnergia atual: ", energia)

			escreva("\nVoce avança pela cidade devastada...")
			escreva("\nO ambiente é hostil e imprevisivel.\n") 
			// ================= MENU DE Ações =================
			faca{
				escreva("\n1 - Explorar cidade (-15 energia)")
				escreva("\n2 - Descansar (-5 energia, Militares -8)")
				escreva("\n3 - Procurar suprimentos (+ 15 energia medicos, +10 outras facções)")
				escreva("\nOpção: ")
				leia(movimentacao)

				se(movimentacao < 1 ou movimentacao > 3){
					escreva("\nOPÇÃO INVALIDA!")
				}
			}
			enquanto(movimentacao < 1 ou movimentacao > 3)

			resumo = ""//garante que comece vazia para o dia comeﾃｧar  e mostar oq aconteceu

			// ================= Acoes =================
			se(movimentacao == 1){
				escreva("\nVoce decidiu explorar a cidade.")
				energia = energia - 15
				explorar++
				resumo = "Explorou a cidade em busca de sobrevivencia."
			}
			senao se(movimentacao == 2){
				escreva("\nVoce descansou em um abrigo abandonado.")
				se(faccao == 1){
					energia = energia - 8
				}senao{
					energia = energia - 5
				}
				descansar++// ADICIONAR MAIS UM Ao descansr QUANDO ESCOLHIDo
				resumo = "Descansou para recuperar energia."
			}
			senao se(movimentacao == 3){
				escreva("\nVocê procura suprimentos pela região.")
				se(faccao == 2){
					energia = energia + 15
				}senao{
					energia = energia + 10
				}
				se(faccao == 3){
					chance = u.sorteia(1,100)
					se(chance <= 40){
						escreva("\nVoce encontrou recursos extras!")
						energia = energia + 10
					}
				}
				procurar++
				resumo = "Procurou suprimentos e encontrou recursos."
			}

			// ================= EVENTO ALEATORIO =================
			probabilidade = u.sorteia(1,100)
			se(dificuldade == 1) tipo_Evento = 10// sao as porcentagens 
			senao se(dificuldade == 2) tipo_Evento = 20
			senao tipo_Evento = 30

			se(probabilidade <= tipo_Evento){
				escreva("\n\n EVENTO PERIGOSO! ")
				eventosPerigosos++
				se(faccao == 1) energia = energia - 10
				senao se(faccao == 3) energia = energia - 25
				senao energia = energia - 20

				evento = u.sorteia(1,3)
				se(evento == 1) escreva("\nHorda de zumbis atacando!")
				senao se(evento == 2) escreva("\nPredio desabando!")
				senao escreva("\nEmboscada em um beco!")
			}

			// ================= DESAFIO: KIT MEDICO =================
			chance = u.sorteia(1,100)
			se(chance <= 30){// mesma coisa que possuir uma chance de 30%
				escreva("\nVoce encontrou um kit medico escondido!")
				kitMedico = 1
			}
			se(kitMedico == 1 e energia<=50){
				escreva("\nDeseja usar o kit medico? (1-Sim / 2-Não): ")
				leia(kit)
				se(kit == 1){
					escreva("\nKit usado! +20 energia")
					energia = energia + 20
					kitMedico--// subtrai 
					numKit++
				}
			}

			// ================= LIMITE DE ENERGIA =================
			se(energia > 100) energia = 100
			se(energia <= 0){
				escreva("\nVoce morreu no dia ", turno)
				pare
			}

			// ================= RESUMO DO DIA =================
			escreva("\n\nResumo do dia: ", resumo)
			escreva("\nEnergia final do dia: ", energia)
		}

		// ================= RELATORIO FINAL =================
		escreva("\n\n================================")
		escreva("\n RELATORIO FINAL DA MISSAO")
		escreva("\n================================")
		escreva("\nDias sobrevividos: ", (turno - 1))
		escreva("\nEnergia final: ", energia)
		escreva("\nExplorou: ", explorar)
		escreva("\nDescansou: ", descansar)
		escreva("\nProcurou suprimentos: ", procurar)
		escreva("\nEventos perigosos: ", eventosPerigosos)
          escreva("\nNumeros de kits usados: ",numKit )
		se(energia > 0){
			escreva("\nSTATUS: Chegou a base Aurora!")
		}senao{
			escreva("\nSTATUS: voce conseguiu sobreviver")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5579; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */