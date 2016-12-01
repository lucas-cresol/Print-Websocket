# Print-Websocket

Experimento criado e perl e javascript para impressao Web via websocket  em impressoras termicas Fiscal ou não sem o uso de appet java.

O Codigo foi feito e perl para ser usado em linux e Windows.

Em testes o sistema funciona perfeitamente, podendo até autencicar os documentos.

Foi utilizado os complementos/extencoes dos navegadores GreaseMoney(Firefox), Violent Monkey(opera,chrome), para implementacao do Javascrip.

Execute o script perl com os paramentros IMPRESSORA PORTA CHARCUTTER LOGS (explo >>perl server_impressao.pl LPT1 9000 119 ON.
IMPRESSORA= LPT1,/dev/l0 etc
PORTA = porta de cominicacao websocket
CHARCUTTER= caracter de corte de papel
LOGS= se imprime/mostra log no terminal.

codigo WEBSOCKET no navegador:

var connection = new WebSocket('ws://127.0.0.1:9000');                  
                 
                       connection.onopen = function() {
                           str = "asdasdasdasd";
                          // envia texto para o servidor perl
                           connection.send(str);
                           return;
                       };
                       
                       
                       
