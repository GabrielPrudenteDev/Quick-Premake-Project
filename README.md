# Quick-Premake-Project
 Quick Premake Project.  

 Gerador de projetos para Visual Studio 17, 19 e 22 utilizando o Premake 5.  

# Note  
Para gerar um novo projeto e preciso ir na pasta "Config/Generator" e executar o .bat da versão do Visual Studio desejada.    
O nome do projeto e solução sera o mesmo da pasta raiz.  
Para Adicionar novos arquivos e necessário executar o "Project.bat" na raiz para atualizar o Visual Studio.  
Todos os arquivos extras como Imagems, Sons e etc... tem que estar na pasta "Content" para serem copiados para a versão de "Shipping".  
É recomendado todos os arquivos do programa estarem na pasta "Source/NameDoProjeto"  
Para trocar o icone e so passar o novo icone para a pasta "Config/AppIncon" e trocar o nome dentro do "Resource.rc".  
Para adicionar bibliotecas e só colocalas dentro da pasta "Config/ThirdParty" -> "Include" e a versão "Win32" e "Win64" sera necessário adicionar o nome dela no arquivo do premake em "Config/Premake5/premake5.lua" tem uma função chamada de "Links" e detro tem um campo "--links("")" é sõ remover os dois traços e colocar o nome dela Ex "MyLib.lib".  
  
# Macros
DEBUG_MODE -------> 
RELEASE_MODE -----> 
SHIPPING_MODE ----> 
CONTENT_PATH -----> 
PLATFORM_WINDOWS -> 
