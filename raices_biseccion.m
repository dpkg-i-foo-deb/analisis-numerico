%raices_biseccion, encuentra la raiz de una ecuación utilizando biseccion
%Mateo Estrada Ramirez - 19/11/2021
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

function [raiz] = raices_biseccion(ecuacion, lim_izquierda, lim_derecha, tolerancia)
    
    iterar=1;
    aproximacion_anterior=nan;
    aproximacion=nan;

    while (iterar)
        
        aproximacion = (lim_izquierda + lim_derecha)/2;

        if((abs(aproximacion-aproximacion_anterior)/aproximacion) < tolerancia || ecuacion(aproximacion)==0)
          
            iterar=0;

        end
        
        if( ecuacion(lim_izquierda) * ecuacion(lim_derecha) < 0 )

            lim_derecha=aproximacion;
        
        else

            if( ecuacion(lim_izquierda) * ecuacion(lim_derecha) > 0  )
            
                lim_izquierda=aproximacion;

            end
        end

        aproximacion_anterior=aproximacion;
        
    end
         
    raiz=aproximacion;

end