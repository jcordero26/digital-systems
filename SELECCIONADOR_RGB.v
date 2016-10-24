`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    22:02:52 09/22/2016
// Project Name:    CONTROLADOR RTC CON PICOBLAZE
// Module Name:    SELECCIONADOR_RGB
// Target Devices:      ARTIX 7
// Tool versions:
// Description:   MODULO DE SELECCION DE OBJETOS, LETRAS, TEXTO E IMAGENES PARA LA PANTALLA,
//                SE COMPORTA COMO EL MULTIPLEXOR FINAL DE SALIDA
// Additional Comments:  hecho por JOAO SALAS
//
//////////////////////////////////////////////////////////////////////////////////
module SELECCIONADOR_RGB(
    input clk,
    input wire video_on,reset,
    input wire [9:0] pix_x,pix_y,
    input wire [11:0] rgb_numero_hora,rgb_numero_fecha,rgb_numero_timer,
    input wire [11:0] rgb_ring,rgb_letra,rgb_bordes,rgb_simbolo,rgb_imagen,
    output wire [11:0] rgb_screen,
    output reg okh,okf,okt
    );


//--------------------------------------------------
//      declaracion de wires a utilizar
//-------------------------------------------------

        wire hour1on,hour2on,hour3on;
        wire date1on,date2on,date3on;
        wire timer1on,timer2on,timer3on;
        wire fecha_word,hora_word,timer_word;
        wire barrafecha_on;
        wire ruedaon1_on , ruedaon1_on2 , ruedaon1_on3 , ruedaon1_on4;
        wire teclado_word;
        wire ring_word;
        wire  onfoto;

//------------------------------------------------------------------------------
//      VARIABLES DE CONTROL PARA ACTIVAR LA IMAGEN ADECUADA
//-----------------------------------------------------------------------------

//                       para numeros

    assign hour1on=(96<=pix_x) && (pix_x<=159) &&(64<=pix_y) && (pix_y<=127);
    assign hour2on=(224<=pix_x) && (pix_x<=287) &&(64<=pix_y) && (pix_y<=127);
    assign hour3on=(352<=pix_x) && (pix_x<=415) &&(64<=pix_y) && (pix_y<=127);


    assign date1on=(96<=pix_x) && (pix_x<=159) &&(192<=pix_y) && (pix_y<=255);
    assign date2on=(224<=pix_x) && (pix_x<=287) &&(192<=pix_y) && (pix_y<=255);
    assign date3on=(352<=pix_x) && (pix_x<=415) &&(192<=pix_y) && (pix_y<=255);

    assign timer1on=(96<=pix_x) && (pix_x<=159) &&(320<=pix_y) && (pix_y<=383);
    assign timer2on=(224<=pix_x) && (pix_x<=287) &&(320<=pix_y) && (pix_y<=383);
    assign timer3on=(352<=pix_x) && (pix_x<=415) &&(320<=pix_y) && (pix_y<=383);

//            para puntos separadores de hora fecha y crono

    assign ruedaon1_on  = (180 <= pix_x) && (pix_x <= 210) && (68 <= pix_y) && (pix_y <= 124);
    assign ruedaon1_on2 = (180 <= pix_x) && (pix_x <= 210) && (324 <= pix_y) && (pix_y <= 380);
    assign ruedaon1_on3 = (308 <= pix_x) && (pix_x <= 333) && (68 <= pix_y) &&  (pix_y <= 124);
    assign ruedaon1_on4 = (308 <= pix_x) && (pix_x <= 333) &&(324 <= pix_y) && (pix_y <= 380);
    assign barrafecha_on=((184<=pix_x) && (pix_x<=205) && (188<=pix_y) && (pix_y<=260))|
         ((310<=pix_x) && (pix_x<=331) && (188<=pix_y) && (pix_y<=260));

//                para el texto informativo

    assign fecha_word=(15<=pix_x) && (pix_x<=75) &&(210<=pix_y) && (pix_y<=240);
    assign hora_word=(15<=pix_x) && (pix_x<=75) &&(72<=pix_y) && (pix_y<=110);
    assign timer_word=(15<=pix_x) && (pix_x<=75) &&(325<=pix_y) && (pix_y<=355);
    assign teclado_word=(470<=pix_x) && (pix_x<=565) &&(36<=pix_y) && (pix_y<=60);

//                      para RING
    assign ring_word=(460<=pix_x) && (pix_x<=520) &&(315<=pix_y) && (pix_y<=387);

//        para las imagenes informativos del teclado y otros

    assign onfoto =(460<=pix_x) && (pix_x<=580) &&(64<=pix_y) && (pix_y<=272);


//NOTA:  PARA LOS BORDES ES EL ELSE


//---------------------------------------------------
//        SALIDA FINAL RGB HACIA PANTALLA
//----------------------------------------------


reg [11:0] rgb_screenreg;

always@(posedge clk)
    if(reset) begin
          rgb_screenreg<=0;
          okf<=0;
          okh<=0;
          okt<=0;
    end
    else begin
        case(video_on)
        0:  begin
            			rgb_screenreg<=0;
            end
        1:  begin
              if  (hour1on | hour2on | hour3on ) begin   //NUMEROS DE HORA
                    	rgb_screenreg <= rgb_numero_hora;
                      okh<=1;end

              else if ( date1on | date2on | date3on )begin  //NUMEROS DE FECHA
                      rgb_screenreg <= rgb_numero_fecha;
                      okf<=1;end

              else if ( timer1on | timer2on | timer3on) begin  //NUMEROS DE TIMER
                      rgb_screenreg <= rgb_numero_timer;
                      okt<=1;end

              else if(fecha_word | hora_word)   //TEXTO INFORMATIVO DE HORA Y FECHA
                      rgb_screenreg <= rgb_letra;

              else if(timer_word | teclado_word)  //TEXTO INFORMATIVO DE TIMER Y TECLAD0
                      rgb_screenreg <= rgb_letra;

              else if (barrafecha_on  | ruedaon1_on4 ) //PUNTOS Y SLASH SEPARADOR EN EL RELOJ
                      rgb_screenreg <= rgb_simbolo;

              else if ( ruedaon1_on | ruedaon1_on2 | ruedaon1_on3) //PUNTOS RESTANTES
                      rgb_screenreg <= rgb_simbolo;

              else if( ring_word )  //  ALARMA
                      rgb_screenreg <= rgb_ring;

              else if(onfoto)   //IMAGENES CON INFORMACION DE PROPOSITO GENERAL
                      rgb_screenreg <= rgb_imagen;

              else    //BORDES QUE ENCIERRAN EL RELOJ
                      rgb_screenreg <= rgb_bordes;
              end

          default: rgb_screenreg<=12'h000;
          endcase
    end

//    salida final

 assign rgb_screen=rgb_screenreg;


endmodule
