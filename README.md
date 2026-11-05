Art of Conquest
Art of Conquest é um jogo de tabuleiro digital de estratégia e dedução por turnos, ambientado em um conflito militar fictício. O jogador controla a equipe azul e enfrenta a equipe vermelha, comandada pelo computador.

A proposta é combinar posicionamento, memória e análise de riscos: as unidades inimigas começam com suas identidades ocultas e são reveladas durante os combates. Para vencer, é necessário capturar a bandeira adversária ou eliminar todas as unidades inimigas.
Este guia descreve o protótipo N3 disponibilizado. Algumas funcionalidades previstas no GDD ainda não estão implementadas ou apresentam diferenças na versão atual.

Requisitos
Para jogar pelo executável
- Windows 10 ou 11 de 64 bits.
- Placa gráfica e drivers compatíveis com o renderizador utilizado pelo projeto: Mobile, configurado com Direct3D 12 no Windows.
- Mouse ou touchpad com botão esquerdo.
- Espaço disponível para extrair o pacote completo.
O executável não exige a instalação do editor Godot, do Git ou de ferramentas de programação. Após o download, o jogo funciona sem conexão com a internet.

Não foram estabelecidos requisitos mínimos próprios de processador, memória RAM e memória de vídeo por meio de testes de desempenho. Os requisitos gerais da engine podem ser consultados na documentação do Godot 4.6.
Para executar pelo código-fonte
- Godot 4.6.1, edição Standard, versão identificada no executável fornecido. O projeto declara a versão 4.6 em suas configurações.
- Windows e hardware compatíveis com a engine e com o renderizador configurado.
- Git, somente se o projeto for obtido por clonagem.
O projeto utiliza GDScript. Não é necessário instalar .NET, Python, bibliotecas externas ou plugins adicionais.
Como baixar o projeto
Pelo GitHub
1. Acesse o repositório ArtOfConquest.
2. Clique em Code > Download ZIP.
3. Extraia o conteúdo para uma pasta no computador.
Também é possível clonar o repositório pelo terminal:
git clone https://github.com/vitorhgo27/ArtOfConquest.git
cd ArtOfConquest
Pelo pacote da versão N3
Extraia o arquivo ArtOfConquest-N3.zip antes de executar o jogo. O pacote analisado contém:
ArtOfConquest-N3/
├── Código Fonte/
│   ├── project.godot
│   ├── menu.tscn
│   ├── main.tscn
│   ├── piece.tscn
│   ├── scripts e demais arquivos do projeto
│   └── assets/
└── Jogo Executável/
	├── PrototipoArtOfConquest.exe
	└── PrototipoArtOfConquest.pck
A organização do repositório pode ser diferente da organização do pacote. Para localizar o código-fonte, procure o arquivo project.godot.
Como executar
Opção 1 — Executável para Windows
1. Extraia todo o pacote.
2. Abra a pasta Jogo Executável.
3. Mantenha PrototipoArtOfConquest.exe e PrototipoArtOfConquest.pck na mesma pasta.
4. Abra PrototipoArtOfConquest.exe.
5. No menu principal, clique em Jogar.
O arquivo .pck contém os recursos do jogo e é necessário para a execução. Não execute o programa diretamente de dentro do ZIP.
Opção 2 — Pelo editor Godot
1. Baixe e extraia o Godot 4.6.1 Standard pelo arquivo oficial de versões.
2. Abra o Godot.
3. No gerenciador de projetos, clique em Importar.
4. Selecione o arquivo project.godot, localizado na pasta do código-fonte.
5. Confirme a importação e abra o projeto.
6. Aguarde a importação automática das imagens e dos áudios.
7. Pressione F5 ou clique em Executar Projeto, no canto superior direito.
8. No menu do jogo, clique em Jogar.
Utilize F5 para iniciar pela cena principal, menu.tscn. A opção F6 executa apenas a cena aberta no editor e pode ignorar o menu.

Não é necessário instalar templates de exportação para jogar pelo editor. Eles são necessários somente para gerar um novo executável.
Como iniciar uma partida
O tabuleiro possui 8 colunas e 8 linhas. Você controla as peças de borda azul, na parte superior, e o computador controla as peças de borda vermelha, na parte inferior.

Cada equipe começa com oito unidades, sendo duas de cada nível:
	
Nível	Unidade na versão atual	Quantidade por equipe
1	Agente Infiltrado	2
2	Fuzileiro	2
3	Lançador de Mísseis	2
4	Atirador de Elite	2


Após clicar em Jogar:
1. O computador posiciona suas oito peças aleatoriamente nas duas últimas linhas.
2. Posicione suas peças clicando nas casas vazias destacadas em azul, nas duas primeiras linhas do topo.
3. A casa da bandeira azul não pode ser utilizada durante o posicionamento.
4. As unidades são colocadas na ordem 1, 1, 2, 2, 3, 3, 4, 4. A mensagem abaixo do tabuleiro informa o próximo nível.
5. Após posicionar a oitava unidade, a partida começa automaticamente.
6. A equipe azul realiza o primeiro movimento.
Não há confirmação adicional para começar, nem opção de desfazer o posicionamento.
Controles
Todas as ações de jogo são realizadas com o botão esquerdo do mouse.
Ação	Como realizar
Iniciar	Clique em Jogar no menu principal.
Posicionar uma unidade	Clique em uma casa vazia destacada durante a preparação.
Selecionar uma unidade	No seu turno, clique em uma peça azul.
Trocar a unidade selecionada	Clique em outra peça azul.
Movimentar	Após selecionar uma peça, clique em uma casa vazia imediatamente acima, abaixo, à esquerda ou à direita.
Jogar novamente	Ao terminar a partida, clique em Jogar novamente.
Sair pelo menu	Clique em Sair.
Encerrar durante a partida	Feche a janela do jogo.


As peças são movimentadas por seleção e clique no destino. Não é necessário arrastá-las.

Não existem comandos próprios de movimentação por teclado, botão de ataque ou atalho de pausa.
Regras de movimentação e turnos
- Cada turno permite movimentar uma unidade por uma casa.
- Os movimentos podem ser feitos para cima, para baixo, para a esquerda ou para a direita.
- Não é permitido movimentar na diagonal, saltar casas ou ocupar uma casa que já contenha outra unidade.
- Clicar em um destino inválido não movimenta a peça nem encerra o turno.
- Após um movimento válido e a resolução dos combates, o turno passa ao adversário.
- Durante a mensagem Pensando... (VERMELHO), aguarde a jogada automática do computador.
- Aguarde o término das animações antes de realizar a próxima ação.
As imagens de trincheiras, crateras e outros elementos do cenário são decorativas: não criam obstáculos ou modificadores de movimentação no código atual.
Combate e revelação das unidades
O combate acontece automaticamente após um movimento, quando a peça movimentada termina ao lado de uma unidade inimiga. São consideradas apenas as quatro casas vizinhas: acima, abaixo, esquerda e direita.

Não clique na casa ocupada pelo inimigo para atacar. Mova sua peça para uma casa vazia ao lado dele.
Confronto contra um inimigo
Quando existe exatamente um inimigo adjacente à peça que acabou de se mover:
- As unidades envolvidas revelam seus níveis.
- A unidade de maior nível sobrevive.
- A unidade de menor nível é removida.
- Se os níveis forem iguais, ambas são removidas.
Por exemplo, uma unidade de nível 3 vence uma de nível 2. Duas unidades de nível 3 eliminam uma à outra.

A unidade sobrevivente permanece em sua própria casa; ela não avança automaticamente para a posição da unidade eliminada.
Cerco
Se a peça que acabou de se mover terminar ao lado de dois ou mais inimigos, ela é eliminada independentemente de seu nível. Os inimigos adjacentes são revelados e permanecem no tabuleiro.

Essa verificação é aplicada à peça movimentada. O jogo não realiza uma avaliação geral de todos os cercos existentes no tabuleiro.
Informação oculta
As suas unidades começam com os níveis visíveis. As unidades vermelhas começam ocultas e são reveladas ao participar de um combate ou cerco.

Uma unidade inimiga revelada permanece identificada pelo restante da partida.
Objetivo, vitória e derrota
A bandeira azul fica na quinta coluna da primeira linha, contando a partir do canto superior esquerdo. A bandeira vermelha fica na quinta coluna da última linha.

Você vence quando:
- Uma unidade azul ocupa a casa da bandeira vermelha e permanece nela após a resolução do combate; ou
- Todas as unidades vermelhas são eliminadas.
Você perde quando:
- Uma unidade vermelha ocupa a casa da bandeira azul e permanece nela após a resolução do combate; ou
- Todas as unidades azuis são eliminadas.
Ao encerrar a partida, o jogo informa a equipe vencedora e apresenta o botão Jogar novamente. Esse botão reinicia o tabuleiro e retorna à etapa de posicionamento.

Limitação da regra atual: caso as últimas unidades das duas equipes sejam eliminadas simultaneamente, o código atribui a vitória à equipe vermelha. Não existe um resultado de empate implementado para essa situação.
Exemplo de primeira jogada
1. Clique em Jogar.
2. Distribua suas oito unidades nas duas linhas superiores, deixando a bandeira livre.
3. Quando aparecer Sua Vez (AZUL), clique em uma peça da segunda linha.
4. Clique na casa vazia imediatamente abaixo dela, na terceira linha.
5. Aguarde a movimentação do computador.
6. Continue avançando, protegendo sua bandeira e evitando terminar um movimento ao lado de dois ou mais inimigos.
Utilize as unidades reveladas para planejar os próximos confrontos. Como cada equipe possui duas unidades de cada nível, acompanhar as eliminações ajuda a deduzir quais forças ainda estão ocultas.
Progressão
A versão atual oferece partidas independentes no mesmo tabuleiro. Não há campanha, desbloqueios, experiência acumulada ou aumento de atributos.

A progressão acontece pelo aprendizado do jogador: compreender os combates, memorizar unidades reveladas e melhorar as decisões de posicionamento e movimentação.
Limitações e funcionalidades ainda não implementadas
- O jogo não possui tutorial interno.
- Há somente o modo de um jogador contra o computador; não há multiplayer local ou online.
- O pacote contém uma exportação para Windows de 64 bits. Não inclui versões prontas para navegador, Linux ou macOS.
- Não há painel de descarte ou histórico visual de unidades eliminadas.
- Não há habilidades especiais por tipo de unidade. O combate utiliza comparação de níveis e a regra de cerco.
- O General possui referência de imagem no código, mas não é incluído nos exércitos desta versão.
- O posicionamento inicial utiliza duas linhas por equipe, embora o GDD mencione três em sua descrição.
- O nível 4 utiliza a imagem do Atirador de Elite, diferentemente da identificação como General em parte do GDD.
- O adversário escolhe movimentos aleatórios entre as opções válidas, priorizando avanços e movimentos laterais. Não há seleção de dificuldade.
- Não há salvamento, carregamento, pausa, controle de volume ou retorno ao menu durante a partida.
- Não há indicação visual dos destinos válidos ou destaque específico para a peça selecionada.
- Não há tratamento completo de empate, repetição de movimentos ou bloqueio do jogador sem jogadas possíveis.
Problemas de execução
Se o executável não abrir:
1. Confirme que o pacote foi extraído completamente.
2. Verifique se o .exe e o .pck estão na mesma pasta.
3. Confira se o Windows é de 64 bits e se os drivers gráficos estão atualizados.
4. Tente executar pelo editor Godot 4.6.1, seguindo as instruções acima.
Se o erro estiver relacionado ao renderizador gráfico, uma alternativa de diagnóstico pelo código-fonte é selecionar Compatibility no seletor de renderização do editor e reiniciar o projeto quando solicitado. A configuração original utiliza Mobile; a compatibilidade dessa alternativa precisa ser testada no computador utilizado.
