# Pedidos API

Microserviço de pedidos do ecossistema **Alura Food**, desenvolvido com Spring Boot.  
A API permite criar pedidos, listar pedidos e atualizar status, com persistência em PostgreSQL e versionamento de banco via Flyway.

## Tecnologias

- Java 17
- Spring Boot 4.0.6
- Spring Web MVC
- Spring Data JPA
- Flyway
- PostgreSQL
- Spring Cloud Netflix Eureka Client
- OpenFeign (dependência já incluída)
- ModelMapper
- Lombok
- Maven Wrapper (`mvnw`, `mvnw.cmd`)

## Estrutura do projeto

- `src/main/java/codex/food/pedidos/PedidosApplication.java`: classe principal
- `src/main/java/codex/food/pedidos/controller/PedidoController.java`: endpoints REST de pedidos
- `src/main/java/codex/food/pedidos/service/PedidoService.java`: regras de negócio
- `src/main/java/codex/food/pedidos/repository/PedidoRepository.java`: acesso a dados (JPA)
- `src/main/java/codex/food/pedidos/model/*`: entidades e enum de status
- `src/main/java/codex/food/pedidos/dto/*`: objetos de transporte (DTO)
- `src/main/resources/db/migration/*`: migrations Flyway
- `src/main/resources/application.properties`: configuração da aplicação

## Pré-requisitos

- JDK 17 instalado
- PostgreSQL em execução
- Banco `pedidos` criado
- (Opcional, mas recomendado) Servidor Eureka em `http://localhost:8081/eureka`

## Configuração

No arquivo `src/main/resources/application.properties`, a aplicação está configurada para:

- Banco: `jdbc:postgresql://localhost:5432/pedidos`
- Usuário: `postgres`
- Hibernate: `ddl-auto=validate`
- Flyway: `baseline-on-migrate=true`
- App name: `pedidos`
- Eureka: `http://localhost:8081/eureka`
- Porta: `server.port=0` (porta aleatória)

> Com `server.port=0`, a aplicação sobe em porta dinâmica.  
> Use o endpoint `GET /pedidos/porta` para descobrir qual instância respondeu.

## Como executar (PowerShell)

```powershell
# na raiz do projeto
.\mvnw.cmd clean spring-boot:run
```

Endpoints

Base path: /pedidos
GET /pedidos
Lista todos os pedidos.
GET /pedidos/{id}
Busca pedido por ID.
POST /pedidos
Cria um novo pedido

{
"itens": [
{
"quantidade": 2,
"descricao": "Hambúrguer artesanal"
},
{
"quantidade": 1,
"descricao": "Refrigerante lata"
}
]
}

PUT /pedidos/{id}/status
{
"status": "CONFIRMADO"
}


PUT /pedidos/{id}/pago
Marca o pedido como pago.
GET /pedidos/porta
Retorna texto com a porta da instância que atendeu.
Status possíveis do pedido
Definidos em src/main/java/codex/food/pedidos/model/Status.java:
REALIZADO
CANCELADO
PAGO
NAO_AUTORIZADO
CONFIRMADO
PRONTO
SAIU_PARA_ENTREGA
ENTREGUE
Observações importantes
Existe apenas um teste de contexto em src/test/java/codex/food/pedidos/PedidosApplicationTests.java.
A migration src/main/resources/db/migration/V2__cria_tabela_item_pedido.sql parece conter um parêntese extra no final; se o Flyway falhar ao subir, revise esse arquivo.
O application.properties atual contém credenciais em texto plano; para ambientes reais, prefira variáveis de ambiente ou secret manager.


