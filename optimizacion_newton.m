%optimizacion_newton Encuentra el valor de x que maximiza a f(x)
%utilizando el método de Newton
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
%along with this program.  If not, see <https://www.gnu.org/licenses/>.

function [resultado] = optimizacion_newton(ecuacion, valor_inicial, tolerancia)
    
    syms x;
    iterar=1;
    aproximacion=valor_inicial;
    aproximacion_anterior=aproximacion;
    derivada = eval(['@(x)' char(diff(ecuacion(x)))]);
    segunda_derivada =eval(['@(x)' char(diff(derivada(x)))]) ;

    while (iterar)
        
        aproximacion = (aproximacion_anterior-(derivada(aproximacion_anterior)) ...
            /(segunda_derivada(aproximacion_anterior)));

        if((abs(aproximacion-aproximacion_anterior)/aproximacion) < tolerancia || ecuacion(aproximacion)==0)
          
            iterar=0;

        end

        aproximacion_anterior=aproximacion;
        
    end
         
    resultado=aproximacion;

end