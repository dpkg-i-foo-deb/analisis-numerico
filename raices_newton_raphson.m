%raices_newton_raphson, encuentra la raiz de una ecuación utilizando
%el método de newton_raphson
%Mateo Estrada Ramirez - 20/11/2021
%This program is free software: you can redistribute it and/or modify
%it under the terms of the GNU General Public License as published by
%the Free Software Foundation, either version 3 of the License, or
%(at your option) any later version.

%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.

%You should have received a copy of the GNU General Public License
%along with this program.  If not, see <https://www.gnu.org/licenses/>.

function [raiz] = raices_newton_raphson(ecuacion, valor_inicial, tolerancia)
    
    syms x;
    iterar=1;
    aproximacion=valor_inicial;
    aproximacion_anterior=nan;
    derivada = eval(['@(x)' char(diff(ecuacion(x)))]);

    while (iterar)
        
        aproximacion = (aproximacion-(ecuacion(aproximacion))/(derivada(aproximacion)));

        if((abs(aproximacion-aproximacion_anterior)/aproximacion) < tolerancia || ecuacion(aproximacion)==0)
          
            iterar=0;

        end

        aproximacion_anterior=aproximacion;
        
    end
         
    raiz=aproximacion;

end