MODULE Motion
    PERS tooldata tool1:=[TRUE,[[0,0,1000],[1,0,0,0]],[2,[0,0,1],[1,0,0,0],0,0,0]];
    PERS string posiciones;         ! String de datos recibidos
    PERS bool isMoving := FALSE;    ! Robot en movimiento
    PERS bool moveRobot_ := FALSE;   ! Orden de movimiento a Robot
    CONST speeddata pickSpeed := v50;
    CONST speeddata moveSpeed := v500;
    
    VAR num uno := 1;
    VAR num dos := 2;
    VAR num cuatro := 4;
    VAR num tres := 3;
    VAR num tam;
    
    
    ! Posiciones del tablero del 3 en raya
    PERS robtarget A1_real:=[[300.72,82.12,189.87],[0.0181734,-0.285561,-0.958104,0.0126739],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget A11_real:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget A1:=[[726.06,73.05,-530.50],[0.132948,-0.0621482,0.989155,-0.00594352],[0,-1,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
    PERS robtarget A2;
    PERS robtarget A3;
    PERS robtarget B1; 
    PERS robtarget B2; 
    PERS robtarget B3; 
    PERS robtarget C1; 
    PERS robtarget C2; 
    PERS robtarget C3; 
    
    ! Posición de las home
    PERS robtarget HOME:=[[481.30,-42.76,-653.40],[0.0128405,0.0185093,0.999569,-0.0188145],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget HOME_REAL:=[[428.75,0.91,281.30],[0.0224062,-0.329085,-0.943979,0.0102644],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
    ! Posiciones mal cogidas en el robo real
    !PERS robtarget Player1:=[[433.67,-213.63,112.85],[0.0386694,-0.750581,-0.659351,0.0197202],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget Player12:=[[489.79,-196.42,113.63],[0.0231731,0.725536,0.687759,0.00693526],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget CASA:=[[514.89,4.80,277.38],[0.0991552,0.574474,0.809672,0.0676676],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget Player2:=[[436.13,231.30,113.96],[0.0156969,-0.368354,-0.929251,0.0237063],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget Player22:=[[488.01,222.37,114.07],[0.0284617,0.396197,0.917344,0.0264315],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget ESQUINA_A1:=[[425.14,106.33,111.30],[0.0562993,-0.546167,-0.833496,0.0617727],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget ESQUINA_A3:=[[570.93,102.76,116.43],[0.0672504,0.571788,0.814893,0.0669686],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget ESQUINA_C1:=[[430.92,-90.17,116.83],[0.0623085,-0.789366,-0.608356,0.0540585],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget HOME10:=[[651.03,-7.27,-708.36],[0.062298,0.725439,0.682447,0.0642088],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget HOME20:=[[617.64,26.37,-729.03],[0.0496293,0.707713,0.702695,0.0538481],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget J11:=[[617.61,26.36,-729.04],[0.0496223,0.707707,0.702702,0.0538368],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	!PERS robtarget Q11:=[[617.61,26.36,-729.04],[0.0496223,0.707707,0.702702,0.0538368],[0,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	
    !Posiciones Bien cogidas en el robot real
    PERS robtarget Player_1:=[[240.00,-115.00,-871.40],[0.0714318,-0.858873,-0.504931,0.047747],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget Player_2:=[[240.00, 115.00,-871.40],[0.0714318,-0.858873,-0.504931,0.047747],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A1:=[[300.72,82.12,189.87],[0.0181734,-0.285561,-0.958104,0.0126739],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A11:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget HOME_REAL10:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A21:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A31:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A41:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget esq_A51:=[[303.51,82.89,171.29],[0.0272737,-0.285439,-0.957835,0.0182608],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    !Posiciones recogida
	PERS robtarget J1_Up:=[[252.64,236.17,-801.84],[0.0150434,-0.399708,0.916516,-0.00243352],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget J1_Down:=[[253.59,236.53,-837.06],[0.0152705,-0.399688,0.916521,-0.00236437],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget J2_Up;
    PERS robtarget J2_Down;
    PERS robtarget J3_Up;
    PERS robtarget J3_Down;
	PERS robtarget Q1_Up:=[[198.61,-236.76,-806.33],[0.00909398,-0.39314,-0.919421,0.00477778],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget Q1_Down:=[[198.63,-236.78,-838.33],[0.00908256,-0.393165,-0.919411,0.00478025],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS robtarget Q2_Up;
    PERS robtarget Q2_Down;
    PERS robtarget Q3_Up;
    PERS robtarget Q3_Down;
	
    !Interpolaciones hechas por mi
    
    !*********************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    !
    ! Versión: 1.0
    !
    !*********************
    
    PROC main()
        
        !Variables de posiciones unicas
        VAR string pos1;
        VAR string pos2;   
        
        Initialise;
        
        !Espera a que se mande la orden de movimiento
        WaitUntil moveRobot_ = TRUE;
        !isMoving := TRUE;
        moveRobot_ := FALSE;
        
        !Se guardan los dos primeros y los dos ultimos indices del string recibido en módulo COM
        !Hay 2 casos:
        !   -Jugando la partida:
        !   -Se reciben 2 posiciones. La de coger la pieza fuera del tablero y la de colocarla en el tablero
        !       -Ej: "J1;A1"
        !   -Fin de la partida
        !   -Se recibe una cadena con mas de 2 posiciones y en la primera posicion se indica a que jugador corresponden esas piezas. 
        !    (Jugador 1 (J) o Jugador 2 (Q)) .Esto indica que la partida se ha terminado y se tienen que recoger las piezas
        !    del tablero y colocarlas en el lugar correspondiente. 
        !       -Ej: "J;A1;A2;A3;" d
        
        tam := StrLen(posiciones);
        
        IF tam = 5 THEN
            pos1 := StrPart(posiciones,1,2);
            pos2 := StrPart(posiciones,4,2);
            Trayectoria pos1, pos2;
        ELSE
            !recoger_piezas posiciones;
        ENDIF
        
    ENDPROC
        
    PROC Trayectoria(string p1, string p2)
        !Empezamos siempre yendo a la posicion de HOME
        MoveJ HOME, moveSpeed, z20, tool1;
        !Cogemos la ficha
        !movimiento p1;
        !Vamos a la posicion HOME
        MoveJ HOME, moveSpeed, z20, tool1;
        !Colocamos la ficha
        movimiento p2;
        WaitTime 1;
        !SetDO coger,0;
        !Vamos a la posicion HOME
        MoveJ HOME, moveSpeed, z20, tool1;
        p1:="";
        p2:="";
    ENDPROC
    
    PROC movimiento(string pos)
        
        ! Las posiciones exactas de las piezas son J12_real y Q1_Down
        ! Falta: 
        !          - cambiar nombres más intuitivos y borrar posiciones y variables no usadas
        !          - Todos las posiciones: seria corercto que la herramienta apuntara perpendicularmente
        !                al plano, es decir, que durante todo el juego el angulo de la herramienta no cambie (para evitar
        !                que la pieza se caiga por gravedad
        !          - Las posiciones de traslado de piezas tienen que estar minimo 300mm sobre el suelo (para que no choquen entre sí)
        !          - cada pieza mide mas o menos 10-15cm
        
        
        TEST pos
            CASE "J1" :
                MoveJ J1_Up, v200, z20, tool0;
                MoveL J1_Down, v200, z20, tool0;
                WaitTime 1;
                !SetDO coger,1;
                WaitTime 1;
                MoveL J1_Up, v200, z20, tool0;
            CASE "J2" :
                J2_Up := Offs(J1_Up, 40, 0, 0); 
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(J1_Down, 40, 0, 0), v20, fine, tool0;
            CASE "J3" :
                !J3 := Offs(J1_Up, 80, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(J1_Down, 80, 0, 0), v20, fine, tool0;
            CASE "J4" :
                !J4 := Offs(J1_Up, 120, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(J1_Down, 120, 0, 0), v20, fine, tool0;
            CASE "J5" :
                !J5 := Offs(J1_Up, 160, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(J1_Down, 160, 0, 0), v20, fine, tool0;
            CASE "Q1" :
                MoveJ Q1_Up, v200, z20, tool0;
                MoveL Q1_Down, v200, z20, tool0;
                WaitTime 1;
                !SetDO coger,1;
                WaitTime 1;
                MoveL Q1_Up, v200, z20, tool0;
                !MoveJ Offs(Q1, 0, 0, -20), v20, fine, tool0;
            CASE "Q2" :
                !Q2 := Offs(Q1_Up, 40, 0, 0); 
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(Q1_Down, 40, 0, 0), v20, fine, tool0;
            CASE "Q3" :
                !Q3 := Offs(Q1_Up, 80, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(Q1_Down, 80, 0, 0), v20, fine, tool0;
            CASE "Q4" :
                !Q4 := Offs(Q1_Up, 120, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(Q1_Down, 120, 0, 0), v20, fine, tool0;
            CASE "Q5" :
                !Q5 := Offs(Q1_Up, 160, 0, 0);
                MoveJ HOME, v200, z20, tool0;
                MoveL Offs(Q1_Down, 160, 0, 0), v20, fine, tool0;
            CASE "A1" :
               MoveJ A1_real, v200, z20, tool0;
               MoveJ A11_real, v200, z20, tool0;  
            CASE "A2" :
                A2 := Offs(A1_real, 0, -80, 0); 
                MoveJ A2, v200, z20, tool0;
                MoveL Offs(A11_real, 0, -80, 0), v20, fine, tool0;
            CASE "A3" :
                A3 := Offs(A1_real, 0, -160, 0); 
                MoveJ A3, v200, z20, tool0;
                MoveJ Offs(A11_real, 0, -160, 0), v20, fine, tool0;
            CASE "B1" :
                B1 := Offs(A1_real, 80, 0, 0); 
                MoveJ B1, v200, z20, tool0;
                MoveJ Offs(A11_real, 80, 0, 0), v20, fine, tool0;
            CASE "B2" :
                B2 := Offs(A1_real, 80, -80, 0); 
                MoveJ B2, v200, z20, tool0;
                MoveJ Offs(A11_real, 80, -80, 0), v20, fine, tool0;
            CASE "B3" :
                B3 := Offs(A1_real, 80, -160, 0); 
                MoveJ B3, v200, z20, tool0;
                MoveJ Offs(A11_real, 80, -160, 0), v20, fine, tool0;
            CASE "C1" :
                C1 := Offs(A1_real, 160, 0, 0); 
                MoveJ C1, v200, z20, tool0;
                MoveJ Offs(A11_real, 160, 0, 0), v20, fine, tool0;
            CASE "C2" :
                C2 := Offs(A1_real, 160, -80, 0); 
                MoveJ C2, v200, z20, tool0;
                MoveJ Offs(A11_real, 160, -80, 0), v20, fine, tool0;
            CASE "C3" :
                C3 := Offs(A1_real, 160, -160, 0); 
                MoveJ C3, v200, z20, tool0;
                MoveJ Offs(A11_real, 160, -160, 0), v20, fine, tool0;
            DEFAULT:
                !no hacer nada?
        ENDTEST
        
    ENDPROC
    
    PROC recoger_piezas(string recoger)
         
        VAR string posicion;
        VAR num j := 1;
        VAR num contador;
        VAR num tam;
        VAR string player;
        VAR string player_aux;
        
        tam := StrLen(recoger);
        player := StrPart(recoger,1,1);
        player_aux := player;
        
        !cambiar por un while porque sino me salgo fuera de la cadena
        FOR i FROM 3 TO tam DO
            contador := i;
            
            player_aux := player + ValToStr(j);
            posicion :=  StrPart(recoger,i,2);   
            trayectoria posicion, player_aux;
            
            j := j+1;
            
        ENDFOR
    ENDPROC
    
    PROC Initialise()
        
    ENDPROC
    
ENDMODULE