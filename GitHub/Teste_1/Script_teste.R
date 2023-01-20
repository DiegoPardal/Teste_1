usethis::use_git()
usethis::use_git_remote("origin", url = NULL, overwrite = TRUE)
usethis::use_github()
usethis::use_readme_md()

# testando
library(openxlsx) ## ativa o package
#rowNames = T caso tenha que usar linhas como nome
dados<- read.xlsx(file.choose(), sheet = 1, colNames = T) # ABRE O ARQUIVO
# NOME DO ARQUIVIO: Guilda tr?fica.xlsx
# SHEET = 1
#View(dados) #veja o arquivo em uma aba no script
str(dados) #mostra a SRTructure "estrutura dos dadosM"
names(dados) # NOME DAS VARI?VEIS DAS COLUNAS
dados$g_t<-as.factor(dados$g_t) # Guildas tr?ficas como fator
str(dados) #mostra a SRTructure "estrutura dos dados"
################################################################################
