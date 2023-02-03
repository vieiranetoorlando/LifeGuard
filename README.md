# **LifeGuard** 



## *Projeto LifeGuard*



## Introdução:



O projeto LifeGuard tem como objetivo criar uma solução que abrange as áreas de bem estar físico e mental, qualidade de vida e
saúde 4.0. Utilizamos um protótipo de uma caixa com um botão que ao ser pressionado envia uma notificação de alerta mostrando a localização do dispositivo para o aplicativo. A comunicação entre o dispositivo e o aplicativo será feita por meio de MQTT. 
O dispositivo utilizado é um arduino nano RP2040; possui função de wi-fi e BLE na placa, microprocessador com acelerômetro e giroscópio, microfone digital que permite criar uma interface de voz e também terá conectado um GPS sparkfun logger junto ao um servidor mosquitto no nqttbox. O aplicativo foi desenvolvido em flutter e também possui conexão com mqtt.

## Qual a necessidade do LifeGuard ?

O projeto LifeGuard é uma solução para o envio de notificações de alerta e localização, combinando tecnologias de IoT (Internet das Coisas) e aplicativos móveis.
Segurança aprimorada: Com a opção de enviar notificações de alerta e localização a partir de uma caixa com botão, o projeto pode ajudar a aumentar a segurança de pessoas em situações de emergência.
Redução de tempo de resposta: A transmissão de dados via MQTT e a exibição das informações no aplicativo garante uma resposta rápida e eficiente em caso de emergência.
Facilidade de uso: O aplicativo desenvolvido em Flutter oferece uma interface amigável para exibição de informações, tornando o sistema acessível a todos.
Escalabilidade: A arquitetura do sistema permite a expansão e a adaptação às necessidades futuras, mantendo a alta disponibilidade e eficiência na transmissão de dados.
Otimização de recursos: A utilização de tecnologias como o Arduino RP2040 e o aplicativo Flutter permite a otimização dos recursos disponíveis, tornando o projeto viável e econômico.
Potencial de mercado: O mercado de tecnologias de segurança e IoT tem crescido significativamente nos últimos anos, oferecendo um grande potencial de mercado para o projeto LifeGuard.

## Análise de mercado e público-alvo:

O mercado de segurança pessoal está em constante crescimento, e existe uma demanda crescente por soluções práticas e eficientes para garantir a segurança das pessoas, o público-alvo do projeto LifeGuard são pessoas que precisam de segurança aprimorada em situações de emergência, como aquelas que sofrem de perda de memória como Alzheimer, idosos, pessoas com necessidades especiais, trabalhadores que precisam se proteger em situações de emergência. A solução oferece notificações de alerta e localização através de uma caixa com botão e aplicativo móvel, garantindo uma resposta rápida e eficiente em caso de emergência. Além disso, o aplicativo é desenvolvido em Flutter e oferece uma interface amigável, tornando o sistema acessível a todos. A arquitetura escalável e a otimização de recursos com tecnologias como o Arduino RP2040 e o Flutter tornam o projeto viável e econômico, com um potencial de mercado significativo no crescente mercado de tecnologias de segurança e IoT.

## Plano de negócios:

O plano de negócios para o projeto LifeGuard inclui a produção e comercialização da caixa com botão, bem como a criação e manutenção do aplicativo móvel. Além disso, podemos oferecer  serviços de suporte e atualizações periódicas para garantir a eficiência e segurança do sistema.

## Análise de viabilidade técnica:

A tecnologia envolvida no projeto LifeGuard é apropriada e já é amplamente utilizada em soluções de segurança pessoal. A utilização do Arduino RP2040, do servidor Mosquitto e do aplicativo Flutter garante a eficiência e rapidez na transmissão de dados, em atualizações futuras e utilizaremos outros dispositivos para melhor eficiência.

## Análise de viabilidade financeira:

A análise financeira do projeto LifeGuard aponta para uma elevada viabilidade financeira, com expectativas de retornos financeiros positivos a partir da venda da caixa com botão e dos serviços de suporte e atualizações, o protótipo do projeto LifeGuard tem dispositivos IOT com orçamento estimado para a implementação do projeto de em média  R$110 reais para teste onde pode ser utilizado outros iot assim deixando o preço menor, os software utilizado no mesmo não tem custo de licença .

## Referências e exemplos similares:

Projetos semelhantes já foram implementados com sucesso, como o dispositivo "Emergency Button", que envia uma notificação de alerta para um aplicativo em caso de emergência. Outro exemplo é o aplicativo "Life360", que permite a localização em tempo real de pessoas e pode ser usado como referência.


## Requisitos

Para a realização deste projeto, serão necessários os seguintes itens:

Arduino RP2040

Sparkfun Logger GPS

Botão

Conexão Wi-Fi

Servidor MQTT Mosquitto

Aplicativo Flutter com a dependência MQTT


## Arquitetura

A arquitetura do sistema consistirá em um dispositivo Arduino RP2040 conectado a uma caixa com botão, que enviará a localização atual e a notificação de alerta para o servidor Mosquitto no mqttbox através de uma conexão Wi-Fi. O servidor, por sua vez, fará a transmissão dos dados para o aplicativo Flutter, que exibirá a localização e a notificação de alerta para o usuário.

## Implementação

### A implementação do projeto LifeGuard será feita em etapas, incluindo:

Configuração do Arduino RP2040 e sparkfun logger gps.

Configuração do Servidor MQTT Mosquitto

Configuração do Aplicativo Flutter

Testes


## Configuração do Arduino RP2040 e sparkfun logger gps.

### Microcontrolador RP2040.

A placa RP2040 é uma placa microcontroladora de baixo custo desenvolvida especificamente para Internet das coisas (IoT) e projetos maker. Ela foi projetada pela Raspberry Pi Foundation e é baseada no processador ARM Cortex-M0+. O RP2040 possui recursos avançados como duas CPU cores, hardware de criptografia e muitos pinos de entrada/saída para conexão com sensores e atuadores. Além disso, é compatível com o sistema operacional Raspberry Pi OS e com a comunidade de desenvolvedores Raspberry Pi, o que significa que há uma ampla variedade de bibliotecas, ferramentas e exemplos disponíveis. Estas características tornam a placa RP2040 ideal para projetos IoT de baixo custo que exijam recursos avançados de processamento e conectividade.

<div align="center">
<img src="https://user-images.githubusercontent.com/110175293/216350311-5ce75dfd-6801-4c55-8487-71d1723c84dc.png" width="700px" />
</div>

(foto microcontrolador RP2040).


### SparkFun GPS Logger Shield

O SparkFun GPS Logger Shield é uma placa de expansão para Arduino projetada para capturar dados de GPS e salvar em um cartão SD. Ele permite aos usuários registrar dados de posição, velocidade, tempo e outros dados importantes do GPS. Como a placa é compatível com Arduino, é fácil para os usuários começarem a usá-lo com o seu projeto de IOT.

Em termos de preço, o SparkFun GPS Logger Shield é uma opção acessível para projetos de baixo custo. Ele está disponível por cerca de 50 a 60 dólares, dependendo do local onde é adquirido. Isso o torna uma boa escolha para projetos que precisam de uma solução de registro de GPS acessível e confiável.


<div align="center">
<img src="https://user-images.githubusercontent.com/110175293/216353259-aba9e164-21cc-4948-98fb-beaca49d10f3.jpg"700px" />
</div>

(foto da SparkFun GPS Logger Shield)
                                                                                                                       
                                                                                                                       
 Fazendo testes, enviando a localização com SparkFun GPS Logger Shield                                                                                                                      
<div align="center">
<video autoplay src="https://user-images.githubusercontent.com/110175293/216485591-33a88bb3-ccb0-4fc9-962a-ec1919ba0e2e.mp4" />
</div>
    
### Configurações do dispositivos

Esse código faz o microcontrolador se conectar a uma rede WiFi e se conecta a um broker MQTT (test.mosquitto.org) e publica dados no aplicativo  "LifeGuard", também imprime informações sobre a placa (IP, SSID, sinal, etc.) e envia valores valores quando o botão do dispositivo é pressionado, o objetivo futuro é utilizar a rede móvel para comunicação, ao invés de Wi-Fi.

O WiFiNINA.h é uma biblioteca que fornece uma API para se conectar e se comunicar com redes WiFi usando o chip WiFi NINA.

Já as bibliotecas MQTT.h e MQTTClient.h são usadas para implementar o protocolo MQTT (Message Queueing Telemetry Transport), um protocolo de comunicação leve para Internet das coisas (IoT). Com o MQTT, você pode enviar e receber mensagens a partir de dispositivos IoT conectados à Internet.

Segue a baixo o código do Arduino.

```C++
  #include <WiFiNINA.h>
  #include <MQTT.h>
  #include <MQTTClient.h>
  
  ///////please enter your sensitive data in the Secret tab/arduino_secrets.h
char ssid[] = "nome_da_rede";        // your network SSID (name)
char pass[] = "senha_da_rede";    // your network password (use for WPA, or use as key for WEP)
  int status = WL_IDLE_STATUS;     // the Wifi radio's status
  
  WiFiClient wifiClient;
  MQTTClient mqttClient;
  
  unsigned long lastMillis = 0;
  const char topic[]  = "LifeGuard";
  #define BROKER_IP    "test.mosquitto.org"
  #define DEV_NAME     "mqttdevice"
  #define MQTT_USER    "mqtt_user"
  #define MQTT_PW      "mqtt_password"
  #define TOPIC_SUBSCRIBE "LifeGuard"   //Informe um Tópico único. Caso sejam usados tópicos em duplicidade, o último irá eliminar o anterior.
  
#define pinBotao1 2  //D2 na placa
  
  void printData();
  
  void conectawifi()
  {
     // attempt to connect to Wifi network:
    while (status != WL_CONNECTED) {
      Serial.print("Attempting to connect to network: ");
      Serial.println(ssid);
      // Connect to WPA/WPA2 network:
      status = WiFi.begin(ssid, pass);
  
      // wait 10 seconds for connection:
      delay(10000);
    }
  
    // you're connected now, so print out the data:
    Serial.println("You're connected to the network");
    
    Serial.println("----------------------------------------");
    printData();
    Serial.println("----------------------------------------");
  }
  
  void conectamqtt()
  {
    Serial.print("\nconnectando MQTT...");
    while (!mqttClient.connect(DEV_NAME));//, MQTT_USER, MQTT_PW)) 
    {
      Serial.print(".");
      delay(1000);
    }
    Serial.println("\nMQTT connected!");
    Serial.print("BROKER_IP=");
    Serial.println(BROKER_IP);
    Serial.print("DEV_NAM=");
    Serial.println(DEV_NAME);
    Serial.print("MQTT_USER=");
    Serial.println(MQTT_USER);
    Serial.print("MQTT_PW=");
    Serial.println(MQTT_PW);
    
  }
 
   
  
  
  void setup() {
    pinMode(pinBotao1, INPUT_PULLUP);
  //Initialize serial and wait for port to open:
    Serial.begin(9600);
    while (!Serial);
    conectawifi();
    unsigned long lastMillis = 0;
      // MQTT brokers usually use port 8883 for secure connections.
    mqttClient.begin(BROKER_IP, 1883, wifiClient);
    
    conectamqtt();
  
  }
  
  void loop() {
   
    mqttClient.loop();
    if (!mqttClient.connected()) {
      conectawifi();
      conectamqtt();
     
      printData();
      
    } 
     if (millis() - lastMillis > 1000) {
    lastMillis = millis();
    enviaValores();
     }
      
  }
  
  void printData() {
    Serial.println("Board Information:");
    // print your board's IP address:
    IPAddress ip = WiFi.localIP();
    Serial.print("IP Address: ");
    Serial.println(ip);
  
    Serial.println();
    Serial.println("Network Information:");
    Serial.print("SSID: ");
    Serial.println(WiFi.SSID());
  
    // print the received signal strength:
    long rssi = WiFi.RSSI();
    Serial.print("signal strength (RSSI):");
    Serial.println(rssi);
  
    byte encryption = WiFi.encryptionType();
    Serial.print("Encryption Type:");
    Serial.println(encryption, HEX);
    Serial.println();
  }


  void enviaValores() {
  static bool estadoBotao1 = HIGH;
  static bool estadoBotao1Ant = HIGH;
  static unsigned long debounceBotao1;

  estadoBotao1 = digitalRead(pinBotao1);

  if (  (millis() - debounceBotao1) > 30 ) {  //Elimina efeito Bouncing
    if (!estadoBotao1 && estadoBotao1Ant) {

      //Botao Apertado  
      mqttClient.publish(topic,"ALERTA");
      Serial.println("Botao1 APERTADO. Payload enviado.");

      debounceBotao1 = millis();
    } else if (estadoBotao1 && !estadoBotao1Ant) {

      //Botao Solto
      mqttClient.publish(topic,"0");
      Serial.println("Botao1 SOLTO. Payload enviado.");

      debounceBotao1 = millis();
    }

  }
  estadoBotao1Ant = estadoBotao1;
}

```
(Código do Arduino IDE)

 Dispositivos do protótipo.
  
<div align="center">
<img src="https://user-images.githubusercontent.com/110175293/216487520-7daf1989-133d-4787-8bd9-47fdc1ae8506.jpeg" width="500" height="700" />
</div>                                                                                                          
(Dispositivos do protótipo)
  
  
## Configuração do Servidor MQTT Mosquitto.

### MQTT Mosquitto

O  MQTT Mosquitto que permite que usuários publiquem e recebam informações através do protocolo MQTT. Ele funciona como um intermediário entre dispositivos que desejam compartilhar informações, garantindo que as mensagens sejam transmitidas de maneira segura e confiável. Ao utilizar o MQTT Mosquitto, os usuários podem se conectar ao servidor e publicar ou assinar tópicos, o que permite o intercâmbio de dados entre dispositivos conectados à internet. Este aplicativo é uma opção popular para aplicativos de Internet das coisas (IoT) devido à sua simplicidade de uso e alta disponibilidade.

### Configuração 

Utilizamos no protótipo o MQTTBox Mosquitto apenas para teste o objetivo é utilizar no futuro um servidor AWS EC2 Ubuntu com Docker e Mosquitto instalado na nuvem(Cloud)  ou AWS IOT CORE na nuvem(cloud). 
  
  Exemplo de configuração Cloud AWS EC2 com a instalção do Docker e Mosquitto
  
  ```Linux

#1. Instalação do Docker
sudo apt-get update

sudo apt-get install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

#2. Instalação do Container Eclipse - Mosquitto

sudo mkdir -p /mosquitto/config
sudo mkdir /mosquitto/data
sudo mkdir /mosquitto/log

sudo nano /mosquitto/config/mosquitto.conf

persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
allow_anonymous true
listener 1883

#Ctrl + O para salvar
#Ctrl + X para sair

#3. Execução do Container

docker run -d -p 1883:1883 -p 9001:9001 -v /mosquitto:/mosquitto eclipse-mosquitto

```

### Configuração do protótipo o MQTTBox

Inicie o aplicativo: depois de ter baixado o MQTT, execute o aplicativo e clique em "Nova conexão" para criar uma nova conexão.

Configure a conexão: forneça um nome para a conexão, selecione "Mosquitto" como servidor e insira a porta padrão (1883) ou a porta especificada pelo provedor de serviços MQTT.

Conecte-se ao servidor Mosquitto: clique em "Conectar" para estabelecer uma conexão segura com o servidor Mosquitto.

Publique suas informações: no painel de publicação, insira o tópico e a mensagem que deseja enviar. Clique em "Publicar" para publicar as informações.

Verifique se as informações foram enviadas: você pode verificar se as informações foram corretamente enviadas no painel de assinatura, onde você pode ver as informações recebidas pelo servidor Mosquitto.

## Fase de testes 

O processo de verificação do envio de localização e notificação de alerta para o aplicativo quando o botão do dispositivo IoT é pressionado.
Verificações realizadas.
Para garantir o funcionamento correto do envio de localização e notificação de alerta, foram realizadas verificações em entradas, saídas e ações esperadas.
Testes realizados.
O dispositivo IoT e o aplicativo foram submetidos a testes para confirmar o envio correto de notificações de alerta e localização.
Resultados esperados.
É esperado que, ao pressionar o botão do dispositivo IoT, as informações de localização sejam enviadas corretamente para o aplicativo, gerando uma notificação de alerta.
Com as verificações e testes realizados, é garantido que o envio de localização e notificação de alerta funcione corretamente quando o botão do dispositivo IoT for pressionado. 
  
## Configuração do Aplicativo Flutter

 O desenvolvimento deste projeto utiliza Flutter, um framework de aplicativos para dispositivos móveis da Google. Com Flutter, os desenvolvedores podem criar aplicativos para iOS e Android com uma base de código única, agilizando o processo de desenvolvimento e tornando-o mais eficiente. Além disso, o Flutter oferece uma ampla gama de componentes interativos e visuais, facilitando a criação de interfaces atraentes e bem desenhadas.

A linguagem utilizada para o desenvolvimento do aplicativo é Dart, uma linguagem de programação de alto nível da Google. O Dart possui uma sintaxe simples e fácil de aprender, tornando-se uma escolha popular para desenvolvedores de aplicativos móveis. Além disso, ele permite a criação de aplicativos de maneira rápida e eficiente.

Em resumo, a escolha de Flutter e Dart para o desenvolvimento deste projeto oferece uma plataforma robusta e flexível para a criação de aplicativos de alta qualidade, com uma única base de código e uma linguagem de programação fácil de aprender.
  
### O Desenvolvimento 
  
Este aplicativo em Flutter foi projetado com o objetivo de fornecer uma solução de segurança eficiente em situações de emergência. Além de exibir a localização do dispositivo IoT em tempo real, ele também inclui um sistema de login de usuário, o que garante a privacidade e a segurança dos dados.

A tela de informações da pessoa permite que o usuário adicione e altere as informações importantes sobre ele, como o nome, idade, endereço, etc. Isso é importante porque, em caso de emergência, as informações estarão disponíveis para ajudar no atendimento mais eficiente.

A utilização da API do Google Maps e do Flutter permite uma exibição clara e intuitiva da localização, bem como da informação da pessoa, de forma que o aplicativo seja fácil de usar e acessível para todos.
  
  
  <div align="center">
<img src="https://user-images.githubusercontent.com/110175293/216496430-99b0eb4a-cd1e-4210-871c-370cd4fb6847.JPG" width="700px" />
</div>
  (Algumas das telas do aplicativo, tela de login, GPS e cadastro pessoal.)


## Conclusão:

Este projeto apresenta uma solução escalável para o envio de informações de localização e alertas de emergência. Inicialmente, implementamos um prototipo na forma de uma caixa com botão, mas já com o objetivo futuro de expandir para outros dispositivos como pulseiras, relógios e colares. A comunicação entre o dispositivo e o servidor será realizada através do protocolo MQTT, garantindo alta disponibilidade, eficiência e segurança na transmissão de dados. O aplicativo desenvolvido em Flutter oferecerá uma interface amigável e intuitiva, permitindo aos usuários visualizar e gerenciar as informações de localização e alertas de maneira fácil e eficiente. Este projeto representa uma importante contribuição para a segurança e tranquilidade das pessoas, e com sua escalabilidade, tem o potencial de ser amplamente adotado no futuro.
