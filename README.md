
# Tech Challenge 3 - Grupo 15

Projeto realizado pelo **Grupo 15** da turma da FIAP de Arquitetura de Sistemas .NET com Azure


## Autores

||
|--|
| Luis Gustavo Gonçalves Reimberg |
| Caio Vinícius Moura Santos Maia |
| Evandro Prates Silva |
| Guilherme Castro Batista Pereira |


## UpdateContact

### Tecnologias Utilizadas
- .NET 8
- Dapper
- RabbitMQ
- FluentValidation
- XUnit
- MediatR
- Moq

Dentro da arquitetura de microsserviços desenvolvida para este tech challenge, este projeto realiza a função de atualizar os contatos, seguindo o passo a passo abaixo:

### API
- Receber a requisição
- Validar os dados da requisição e a existência do contato a ser atualizado
- Atualizar o status do contato/registro no banco de dados
- Enviar a requisição para a respectiva fila de atualização

### Worker
- Consumir a fila de atualizações
- Realizar a validação adicional para garantir a integridade do contato/registro no banco de dados
- Atualizar o contato e o seu respectivo status
