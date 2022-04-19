%ecuaciones_gauss_seidel, encuentra la solución aproximada de un sistema 
%de ecuaciones utilizando el método de Gauss Seidel
%Mateo Estrada Ramirez - 22/11/2021
%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.

%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.

%You should have received a copy of the GNU General Public License
%along with this program.  If not, see <https://www.gnu.org/licenses/>

function [solucion] = ecuaciones_gauss_seidel(matriz, vector, solucion_inicial, ...
    tolerancia, limite_iteraciones)

    tam_vector=length(vector);
    aproximacion=solucion_inicial;
    aproximacion_anterior=aproximacion;
    iterar=1;
    iteracion_actual=0;

    while(iterar==1 && iteracion_actual<=limite_iteraciones)

         for contador_columnas=1:tam_vector
               
            sumatoria=matriz(contador_columnas,1:contador_columnas-1)...
                *aproximacion_anterior(1:contador_columnas-1)+...
                matriz(contador_columnas,contador_columnas+1:tam_vector)*...
                aproximacion_anterior(contador_columnas+1:tam_vector);

           aproximacion(contador_columnas)=(vector(contador_columnas)...
               -sumatoria)/(matriz(contador_columnas,contador_columnas));
            
         end

         if norm(aproximacion_anterior-aproximacion)<tolerancia

                iterar=0; 
                    
         end

         aproximacion_anterior=aproximacion;

         iteracion_actual=iteracion_actual+1; 

    end

    solucion= aproximacion;

end