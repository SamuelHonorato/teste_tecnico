# Guia do projeto

**Para iniciar:**
  * Entrar no diretório raiz da aplicação.
  * Ajustar a versão do Elixir no arquivo `mix.exs` de acordo com a instalada na máquina.
  * Executar o comando: `mix run playground.exs`
  
**Especificação do módulo Item:**
  * O módulo Item segue o formato a seguir: `%Item{name: "Arroz", quantity: 10, price: "R$ 3,00", unity: :kg}`. Onde:
    * name: string
    * quantity: inteiros positivos
    * price: string com "," separando os reais dos centavos e SEM separação com "." para valores maiores que R$ 999,99. Centavos sempre com duas casas decimais
    * unity: atom que especifica a metrificação do produto. ":un" para unidade; ":kg" para quilo; ":pkg" para pacote
  
**Especificação do módulo Person:**
  * O módulo Person segue o formato a seguir: `%Person{email: "user@email.com"}`. Onde:
    * email: string
    
**Edição dos valores de entrada:**
  * **Email**: alterar saída do método `generate(:people)` em `playground.exs`. Por exemplo:
    `[%Person{email: "user@email.com.br"}]`
  * **Item**: alterar saída do método `generate(:items)` em `playground.exs`. Por exemplo:
    `[%Item{name: "Arroz", quantity: 10, price: "R$ 3,00", unity: :kg}]`

**Para executar testes:**
  * Entrar no diretório raiz da aplicação.
  * Executar o comando: `mix test`
  
## Ler mais
  * Instalação Elixir: https://elixir-lang.org/install.html
