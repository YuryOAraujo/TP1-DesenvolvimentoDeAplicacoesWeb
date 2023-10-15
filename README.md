# Sistemas de Laudos de Cardiologia

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE.md)

## Tabela de Conteúdos
- [Papéis de Médicos](#papéis-de-médicos)
- [Solicitação de Pedido de Exame](#solicitação-de-pedido-de-exame)
- [Realização do Exame](#realização-do-exame)
- [Avaliação dos Laudos](#avaliação-dos-laudos)
- [Exames Cancelados](#exames-cancelados)
- [Consulta aos Laudos e Exames](#consulta-aos-laudos-e-exames)
- [Login](#login)

## Papéis de Médicos
Um hospital universitário deseja informatizar seu processo de solicitação de exames e emissão de laudos para o serviço de cardiologia. Sendo assim, seus usuários nos forneceram os requisitos a seguir.
Nesta organização de saúde há vários papéis atribuídos aos médicos, que utilizarão o sistema, são eles:
- médico-residente - uma modalidade de ensino de pós-graduação destinada a médicos, na forma de curso de especialização, funcionando em Instituições de Saúde, com a orientação de profissionais médicos;
- médico-docente - são os professores da universidade e responsáveis pelo processo de ensino-aprendizagem dos médicos-residentes;
- demais médicos que trabalham no hospital, realizam as consultas e solicitam exames aos pacientes.
Todo médico tem um nome e um número de CRM (Conselho Regional de Medicina). O CRM pode ser usado como chave primária.
Além dos atributos acima, os médicos-docentes contém também um atributo que identifica a sua titulação na universidade (doutor, assistente, livre-docente ou titular); e os médicos-residentes contém um atributo que identifica o ano de início da residência e sua matrícula (formado pelo ano de início da residência+CRM).

## Login
Para acessar a aplicação é necessário realizar login. As informações de usuário e senha já podem ficar previamente cadastradas no banco de dados. Cadastre 3 médicos de cada modalidade no banco de dados para realizar os testes.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/701587f9-af83-4ecf-96d0-5a82ac69b81a)

## Solicitação de Pedido de Exame
Um médico que não seja docente ou residente pode emitir um pedido de exame; para isto, deve informar:
i) o registro do paciente (CPF). A partir daí, o programa acessa o sistema de registro de pacientes, de onde são recuperados seus dados pessoais (CPF, nome, e-mail, sexo, idade e data de nascimento), onde a idade é calculada em função da data de nascimento. Deixar 10 dados de pacientes cadastrados direto no banco de dados.
ii) o médico seleciona um exame por pedido (apenas os exames ecocardiograma ou eletrocardiograma são realizados. Deixar cadastrado direto na lista de seleção na página de cadastro).
Caso o paciente já tenha um pedido para o exame selecionado na situação “Aguardando Exame”, o sistema não deve permitir que outro pedido seja feito para o mesmo paciente e o mesmo exame.
Sendo assim, essa verificação deve ser feita antes da emissão do pedido de exame.
Caso o pedido ainda não exista, o médico informa a hipótese diagnóstica que deve ser baseada no Código Internacional de Doenças (CID) – onde ficam cadastradas todos os nomes das doenças.
Usar a lista abaixo como opções de hipóteses diagnósticas para CIDs de doenças do coração:
<br>I46 - Parada cardíaca
<br>I47 - Taquicardia paroxística
<br>I48 - Flutter e fibrilacao atrial
<br>I49 - Outras arritmias cardíacas
<br>I42 - Cardiomiopatias
<br>Por fim, ele solicita a emissão do pedido, e o sistema salva e envia o pedido do exame para o e-mail do paciente contendo todas as informações do exame.
No pedido do exame deve constar os dados do paciente, a data prevista de realização (considere 3 dias após a solicitação), o exame que foi solicitado, as recomendações para realização do exame, por exemplo, não comer uma hora antes do exame, e o CRM e nome do médico que solicitou o exame.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/c8b4729a-df3b-41d0-a82d-27b684bc463b)

## Realização do Exame
Os residentes realizam os exames fazendo o uso de equipamentos específicos para cada tipo de exame; ao final de cada um, os equipamentos geram numa pasta pré-definida as imagens do exame em arquivo no formato PDF. Gere o arquivo do resultado do exame do paciente de forma aleatória a partir das imagens anexas ao trabalho.
A partir daí, os residentes poderão registrar a data e hora em que o exame foi realizado. Alterar a situação do exame para “Aguardando Laudo”.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/b4333e1b-d4e8-4025-80fe-73c61ee0f93d)

## Geração de Laudos de Exames Realizados
Após o registro do exame, o mesmo residente ou outro residente qualquer, deve interpretar imagens ou traços contidos no arquivo PDF do exame do paciente e emitir o laudo, ou seja, digitar uma breve descrição e informar uma conclusão que, assim como a hipótese diagnóstica, é baseada no Código Internacional de Doenças. O sistema contribui para a emissão do laudo ao residente conectado ao sistema. Alterar a situação do exame para “Laudo realizado”.
Os laudos emitidos pelos residentes permanecem com status de provisório, então não podem ser consultados pelos médicos que solicitaram o exame.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/99433855-b066-4299-82d9-1c4d01afcd3d)

## Avaliação dos Laudos
Caberá ao docente revisar cada um dos laudos emitidos pelos residentes e transformá-los em laudos com status de definitivo; só assim eles ficam disponíveis na consulta.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/e648eb6a-622e-40bb-99c2-4520524b35f3)

## Exames cancelados
Após 3 dias, os exames não realizados terão seus pedidos cancelados; sendo assim, alguns pedidos de exames não terão laudos. Alterar situação para “Exame cancelado”. Enviar um e-mail para o paciente informando os dados do exame cancelado.

## Consulta aos Laudos e Exames
Deve existir um módulo para que os médicos possam consultar os laudos definitivos, bastando para isso que ele informe o registro do paciente. A partir daí, o sistema exibe a lista de laudos disponíveis para o paciente, o médico então seleciona um laudo e o sistema exibe o exame, sua descrição e conclusão.

![image](https://github.com/YuryOAraujo/TP1-DesenvolvimentoDeAplicacoesWeb/assets/127779626/9b33e0f8-e99a-47f6-94d9-a941c28dadf9)

