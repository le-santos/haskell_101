## Programação Funcional Pura com Haskell

Este repositório inclui soluções para atividades propostas nas aulas de Programação Funcional Pura com Haskell dentro dos [cursos de verão do IME-USP 2024](https://www.ime.usp.br/verao).

## Como executar

Para rodar localmente, siga os passos de instalação listados na página oficial: https://www.haskell.org/ghcup/install/

Para rodar com docker, será necessário ter instalado os pacotes do docker engine na sua máquina: https://docs.docker.com/engine/install/ubuntu/.
Após isso, podes executar os comandos:

```sh
# para fazer build do container
make build

# para subir o ambiente ghci mapeando o volume local para dentro do container
make run

```
